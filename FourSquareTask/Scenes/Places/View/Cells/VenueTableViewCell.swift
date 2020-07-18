//
//  VenueTableViewCell.swift
//  FourSquareTask
//
//  Created by Amr on 7/17/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit
import Kingfisher
class VenueTableViewCell: UITableViewCell {
    
    @IBOutlet weak var venueDescriptionLabel: UILabel!
    @IBOutlet weak var venueNameLabel: UILabel!
    @IBOutlet weak var venueImageView: UIImageView!
    var venueViewModel: VenueViewModel! {
        didSet {
            venueNameLabel.text = venueViewModel.title
            if let url = venueViewModel.imageUrl {
                venueImageView.kf.indicatorType = .activity
                venueImageView.kf.setImage(with: url)
            }
            venueDescriptionLabel.text = venueViewModel.address
        }
    }
}
