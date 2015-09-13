//
//  RafaelTableViewCell.swift
//  TableViewApp
//
//  Created by Giorgio Natili on 8/11/15.
//  Copyright (c) 2015 Natili, Giorgio. All rights reserved.
//

import UIKit

class RafaelTableViewCell: UITableViewCell {

    @IBOutlet weak var curretnImage: UIImageView!
    @IBOutlet weak var currentName: UILabel!
    @IBOutlet weak var currentLocation: UILabel!
    @IBOutlet weak var currentType: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
