//
//  PlacesCoordinator.swift
//  Foursquare-Technical
//
//  Created by Amr on 7/13/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit
import CoreLocation

class PlacesCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let apClient = APIClient.sharedInstance
        let locationManager = CLLocationManager()
        let placesViewModel = PlacesViewModel(apiClient: apClient, locationManager: locationManager)
        let placesViewController = PlacesViewController.instantiate(placesViewModel: placesViewModel)
        navigationController.isNavigationBarHidden = false
        navigationController.pushViewController(placesViewController, animated: true)
    }
}
