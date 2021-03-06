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
    
    // MARK: data
    private var currentData:GroceryItem!
    
    // MARK: UITableViewCell lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: rendering data
    private func updateValues() {
        
        name.text = currentData.name
        icon.image = UIImage(named: currentData.categoryIcon())
        
    }
    
    // MARK: public properties
    var data:GroceryItem {
        
        get {
            
            return currentData
            
        }

        set {

            currentData = newValue
            updateValues()
    
        }
        
    }

}
