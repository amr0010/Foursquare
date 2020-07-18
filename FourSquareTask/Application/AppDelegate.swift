//
//  AppDelegate.swift
//  FourSquareTask
//
//  Created by Amr on 7/13/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        LandingCoordinator(navigationController: navigationController).navigate(window: window)
        return true
    }
    
    
}

