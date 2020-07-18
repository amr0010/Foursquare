//
//  AppCoordinator.swift
//  Foursquare-Technical
//
//  Created by Amr on 7/13/20.
//  Copyright © 2020 Amr. All rights reserved.
//


import UIKit

class LandingCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
      let landingViewController = LandingViewController(nibName: "LandingViewController", bundle: nil)
        self.navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(landingViewController, animated: false)
    }
    
    func navigate(window: UIWindow?) {
        let landingCoordinator = LandingCoordinator(navigationController: self.navigationController)
        self.childCoordinators.append(landingCoordinator)
        landingCoordinator.start()
        window?.rootViewController?.removeFromParent()
        window?.rootViewController = self.navigationController
        window?.makeKeyAndVisible()
    }
}
