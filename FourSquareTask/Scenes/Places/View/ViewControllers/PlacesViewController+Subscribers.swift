//
//  PlacesViewController+Subscribers.swift
//  FourSquareTask
//
//  Created by Amr on 7/17/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit
import RxCocoa

extension PlacesViewController {
    
func setupViewModelsSubscribers() {
    setupTableViewSubscriber()
    setupPlacesVMSubscriber()
    }
    private func setupTableViewSubscriber() {
        placesViewModel.venuesViewModel
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: VenueTableViewCell.identifier, cellType: VenueTableViewCell.self)) { (row, element, cell) in
                cell.venueViewModel = element

            }
            .disposed(by: disposeBag)
    }
    fileprivate func setupPlacesVMSubscriber() {
        placesViewModel.state.subscribe(onNext: { [weak self] (state) in
            switch state {
            case .idle:
                break
            case .errorInLoading(let error):
                break
            case .loadinPlaces:
                break
            case .placesLoaded:
                break
            case .requesUserLocation:
                self?.requestUserAccess()
            case .changeToRealTime:
                self?.navigationItem.rightBarButtonItem?.title = "realtime"
            case .changeToSingleUpdate:
                self?.navigationItem.rightBarButtonItem?.title = "single update"
            }
        }).disposed(by: disposeBag)
    }
    
    fileprivate func requestUserAccess() {
        let alert = UIAlertController(title: "Allow Location Access", message: "The App needs access to your location. Turn on Location Services in your device settings.", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Settings", style: UIAlertAction.Style.default, handler: { action in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(settingsUrl) {
               UIApplication.shared.openURL(settingsUrl)
            }
        }))
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

}

