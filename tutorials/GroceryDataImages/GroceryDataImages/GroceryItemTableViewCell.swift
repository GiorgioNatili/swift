//
//  GroceryItemTableViewCell.swift
//  GroceryDataImages
//
//  Created by Giorgio Natili on 11/13/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class GroceryItemTableViewCell: UITableViewCell {

    // MARK: UI items
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
