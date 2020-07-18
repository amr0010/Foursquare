//
//  Coordinator.swift
//  Foursquare-Technical
//
//  Created by Amr on 7/13/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
