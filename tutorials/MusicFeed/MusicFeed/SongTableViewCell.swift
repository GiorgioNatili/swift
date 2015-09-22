//
//  SongTableViewCell.swift
//  MusicFeed
//
//  Created by Giorgio Natili on 9/21/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell, IRenderSong {

    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var currentTitle: UILabel!
    @IBOutlet weak var currentDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: IRenderSong implementation
    func updateTitle(title: String) {
        
        currentTitle.text = title
        
    }
    
    func updateDescription(description: String) {
        
        currentDescription.text = description
        
    }
    
    func updateCover(cover: String) {
        
        coverImage.image = UIImage(contentsOfFile: cover)
        
    }
    
}
