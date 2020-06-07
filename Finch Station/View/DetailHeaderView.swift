//
//  DetailHeaderView.swift
//  Finch Station
//
//  Created by Jeniean on 07/06/2020.
//  Copyright © 2020 Jens Las Pobres. All rights reserved.
//

import UIKit

class DetailHeaderView: UIView {

    @IBOutlet weak var routeLabel: UILabel!
    @IBOutlet weak var routeURILabel: UILabel!
    @IBOutlet weak var routeGroupIDLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 4.0
    }
}
