//
//  NoDataView.swift
//  FourSquareTask
//
//  Created by Amr on 7/18/20.
//  Copyright © 2020 Amr. All rights reserved.
//

import UIKit

class NoDataView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        print("awake")
    }
    
}
