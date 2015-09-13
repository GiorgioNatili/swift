//
//  GroceryItemTableViewCell.swift
//  GroceryUIPickerCoreData
//
//  Created by Giorgio Natili on 9/9/15.
//  Copyright (c) 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class GroceryItemTableViewCell: UITableViewCell, IRenderItem {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: IRenderItem implementation
    var name: String {
        get {
            return itemLabel.text!
        }
        set {
            itemLabel.text = newValue
        }
    }
    
    var icon: String {
        get {
            
            var value = ""
            
            if let image = itemImage.image {
                
                value = image.description
                
            }
            
            return value
        }
        set {
            itemImage.image = UIImage(named: newValue)
        }
    }

}
