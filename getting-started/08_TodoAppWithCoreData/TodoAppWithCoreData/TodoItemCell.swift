//
//  TodoItemCell.swift
//  TodoAppWithCoreData
//
//  Created by Giorgio Natili on 8/31/15.
//  Copyright (c) 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class TodoItemCell: UITableViewCell {

    // MARK: user interaction
    @IBOutlet weak var editItem: UIButton!
    @IBOutlet weak var deleteItem: UIButton!
    @IBOutlet weak var todoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
