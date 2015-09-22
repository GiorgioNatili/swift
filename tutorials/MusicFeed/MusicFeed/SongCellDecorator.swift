//
//  SongCellDecorator.swift
//  MusicFeed
//
//  Created by Giorgio Natili on 9/21/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class SongCellDecorator: NSObject {
    
    private var cell:IRenderSong!
    private var song:Song!
    
    init(cell:IRenderSong, song:Song){
        
        super.init()
        
        self.cell = cell
        self.song = song
        
        updateData()
        
    }
    
    private func updateData() {
        
        cell.updateCover(song.cover)
        cell.updateTitle(song.title)
        cell.updateDescription(song.about)
        
    }

}
