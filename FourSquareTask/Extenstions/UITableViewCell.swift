//
//  UITableViewCell.swift
//  FourSquareTask
//
//  Created by Amr on 7/17/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit
extension UITableViewCell {
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    static var identifier: String {
        return String(describing: self)
    }
}
