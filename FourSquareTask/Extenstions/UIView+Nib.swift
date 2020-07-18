//
//  UIView+Nib.swift
//  FourSquareTask
//
//  Created by Amr on 7/18/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit
extension UIView {
    class var instanceFromNib: UIView? {
        return Bundle(for: Self.self)
            .loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as? UIView
    }
}
