//
//  SongsProvider.swift
//  MusicFeed
//
//  Created by Giorgio Natili on 9/21/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire

class SongsProvider: NSObject {
    
    static func fetchSongs()  {
        
        var parsed = [Song]()
        let postEndpoint: String = "http://10.13.100.20:9000/v1/random"
        
        Alamofire.request(.GET, postEndpoint)
            .responseJSON { request, response, result in
                
                let jsonSongs = JSON(result.value!)
                
                for (_, subJson):(String, JSON) in jsonSongs {

                    parsed.append(createSong(subJson))
                
                }
                
            NSNotificationCenter.defaultCenter().postNotificationName("songsFeteched", object: parsed)

        }
        
    }
    
    private static func createSong(data:JSON) -> Song {
     
        let song = Song()
        
        song.title = String(data["title"])
        song.about = String(data["description"])
        song.cover = String(data["imageUrl"])
        
        return song
        
    }
    
}
