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

        // Do any additional setup after loading the view.
    }

    @IBAction func startExploreBtnPressed(_ sender: Any) {
        //TODO: - Add coordinator logic
        let placesViewController = HomeTableViewController(nibName: "HomeTableViewController", bundle: nil)
        placesViewController.modalPresentationStyle = .fullScreen
        self.present(placesViewController, animated: true, completion: nil)
    }
    
}
