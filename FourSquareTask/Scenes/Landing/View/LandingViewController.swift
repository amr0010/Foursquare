//
//  LandingViewController.swift
//  Foursquare-Technical
//
//  Created by Amr on 7/13/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func startExploreBtnPressed(_ sender: Any) {
        guard let navigationController = self.navigationController else { return }
        let placesCoordintor = PlacesCoordinator(navigationController: navigationController)
        placesCoordintor.start()
    }
}
