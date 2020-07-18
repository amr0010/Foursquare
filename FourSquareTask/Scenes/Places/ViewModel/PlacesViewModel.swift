//
//  HomeViewModel.swift
//  Foursquare-Technical
//
//  Created by Amr on 7/13/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import Foundation
import CoreLocation
import RxSwift
import RxCocoa
import RxCoreLocation

enum PlacesState {
    case idle
    case loadinPlaces
    case placesLoaded
    case errorInLoading(error: Error)
    case requesUserLocation
    case changeToSingleUpdate
    case changeToRealTime
}
enum PlacesAction {
    case changeStateClicked
}

class PlacesViewModel: NSObject {
    private var apiClient: APIClient?
    private var locationManager: CLLocationManager?
    private let disposeBag = DisposeBag()
    private(set) var venuesViewModel = BehaviorRelay(value: [VenueViewModel]())
    private var userCurrentCoordinate: BehaviorRelay<CLLocationCoordinate2D?> = BehaviorRelay(value: nil)
    private var didFireFirstRequest: Bool = false
    private var isRealtime: Bool = false
    private var stateRelay = BehaviorRelay<PlacesState>(value: .idle)
    private var lastRetrivedCoorindate: CLLocationCoordinate2D?
    var state: Observable<PlacesState> {
        return stateRelay.asDriver().asObservable()
    }
    
    convenience init(apiClient: APIClient, locationManager: CLLocationManager) {
        self.init()
        self.apiClient = apiClient
        self.locationManager = locationManager
        setupLocationSubscriber()
        getUserCurrentLocation()
    }
    
    private func getUserCurrentLocation() {
        locationManager?.rx
            .didChangeAuthorization
            .subscribe(onNext: { [weak self] _, status in
                switch status {
                case .denied:
                    self?.stateRelay.accept(.requesUserLocation)
                case .notDetermined:
                    self?.locationManager?.requestWhenInUseAuthorization()
                case .restricted:
                    self?.stateRelay.accept(.requesUserLocation)
                case .authorizedAlways, .authorizedWhenInUse:
                    self?.subscribeToLocationChanges()
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func subscribeToLocationChanges() {
        locationManager?.startUpdatingLocation()
        locationManager?.rx
            .location.subscribe(onNext: { [weak self] location in
                guard let location = location else { return }
                self?.userCurrentCoordinate.accept(location.coordinate)
            }).disposed(by: disposeBag)
    }
    
    private func setupLocationSubscriber() {
        userCurrentCoordinate.asObservable()
            .subscribe(onNext: { [weak self] (_location) in
                guard let weakself = self, let location = _location else { return }
                if !weakself.didFireFirstRequest || !weakself.isRealtime {
                    weakself.requestNearbyVenues(location: location)
                    weakself.lastRetrivedCoorindate = location
                    weakself.didFireFirstRequest = true
                }
            }, onError: { (error) in
                print("error \(error.localizedDescription)")
            }, onCompleted: nil, onDisposed: nil)
        .disposed(by: disposeBag)
    }
    
    private func requestNearbyVenues(location: CLLocationCoordinate2D) {
        let latitude = Double(location.latitude)
        let longitude = Double(location.longitude)
        apiClient?.getPlaces(latitude: latitude, longitude: longitude).subscribe(onSuccess: { [weak self] (venueDTO) in
            self?.mapToVenuesViewModels(venueDTO)
            },
                                                                                 onError: { (err) in
                                                                                    self.stateRelay.accept(.errorInLoading(error: err))
        }).disposed(by: disposeBag)
    }
    
    fileprivate func mapToVenuesViewModels(_ venues: VenuesDTO) {
        venuesViewModel.accept(venues.response?.venues?.compactMap { return VenueViewModel(venue: $0) } ?? [])
    }
    
    func doAction(action: PlacesAction) {
        switch action {
        case .changeStateClicked:
            changeUpdateState()
        }
    }
    
    private func changeUpdateState() {
        isRealtime = !isRealtime
        isRealtime == true ? stateRelay.accept(.changeToSingleUpdate) : stateRelay.accept(.changeToRealTime)
    }
}
