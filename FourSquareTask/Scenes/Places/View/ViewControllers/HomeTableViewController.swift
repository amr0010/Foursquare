//
//  HomeTableViewController.swift
//  Foursquare-Technical
//
//  Created by Amr on 7/13/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit
import RxSwift
class HomeTableViewController: UITableViewController {
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIClient.sharedInstance.getPlaces()
            .observeOn(MainScheduler.instance)
            .subscribe { (posts) in
                return
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}
