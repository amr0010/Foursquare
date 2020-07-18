//
//  HomeTableViewController.swift
//  Foursquare-Technical
//
//  Created by Amr on 7/13/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit
import RxSwift
class PlacesViewController: UITableViewController {
    
    var placesViewModel: PlacesViewModel!
    let disposeBag = DisposeBag()
    static func instantiate(placesViewModel: PlacesViewModel) -> PlacesViewController {
        let placesViewController = PlacesViewController(nibName: "PlacesViewController", bundle: nil)
        placesViewController.placesViewModel = placesViewModel
        return placesViewController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        setupTableView()
        registerCells()
        setupViewModelsSubscribers()
        setupNavigationBar()
    }
    private func setupNavigationBar() {
        let realTimeBtn = UIBarButtonItem(title: "realTime", style: .plain, target: self, action:  #selector(onClickMethod))
        self.navigationItem.rightBarButtonItem = realTimeBtn
    }
    @objc func onClickMethod() {
        placesViewModel.doAction(action: .changeStateClicked)
    }
    private func setupTableView() {
        tableView.delegate = nil
        tableView.dataSource = nil
        tableView.estimatedRowHeight = 600
        tableView
            .rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
    fileprivate func registerCells() {
        tableView.register(VenueTableViewCell.nib,
                           forCellReuseIdentifier: VenueTableViewCell.identifier)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
