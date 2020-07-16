//
//  PlacesCoordinator.swift
//  Foursquare-Technical
//
//  Created by Amr on 7/13/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit
class PlacesCoordinator: Coordinator {
  
    // MARK: - Properties
  
    let rootViewController: UIViewController

    let rootNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        return navVC
    }()


//    let apiClient: ApiClient

    // MARK: VM / VC's
//    lazy var searchInputViewModel: SearchInputViewModel! = {
//        let viewModel = SearchInputViewModel()
//        viewModel.coordinatorDelegate = self
//        return viewModel
//    }()

//    var locationSearchViewModel: LocationSearchViewModel {
//        let placeService = PlaceApiService(apiClient: apiClient, plistClient: PlistClient())
//        let viewModel = LocationSearchViewModel(service: placeService)
//        viewModel.coordinatorDelegate = self
//        return viewModel
//    }

    // MARK: - Coordinator
//    init(rootViewController: UIViewController, apiClient: ApiClient) {
//        self.rootViewController = rootViewController
//        self.apiClient = apiClient
//    }
    
     init(rootViewController: UIViewController) {
            self.rootViewController = rootViewController
//            self.apiClient = apiClient
        }

    override func start() {
        let placesViewController = HomeTableViewController(nibName: "HomeTableViewController", bundle: nil)
        rootNavigationController.setViewControllers([placesViewController], animated: false)
    }

    override func finish() {
    }
    
}
