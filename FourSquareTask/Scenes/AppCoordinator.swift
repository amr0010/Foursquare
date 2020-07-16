//
//  AppCoordinator.swift
//  Foursquare-Technical
//
//  Created by Amr on 7/13/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit
class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    let window: UIWindow?
    
    lazy var rootViewController: UIViewController = {
        let viewController = LandingViewController(nibName: "LandingViewController", bundle: nil)
        return viewController
    }()
    
    // MARK: - Coordinator
    init(window: UIWindow?) {
        self.window = window
    }

    override func start() {
        guard let window = window else {
            return
        }

        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }

    override func finish() {

    }

}
