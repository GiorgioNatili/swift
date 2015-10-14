//
//  TranslationService.swift
//  TheOtherWay
//
//  Created by Giorgio Natili on 10/13/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TranslationService: NSObject {

    private let URL:String = "https://translate.yandex.net/api/v1.5/tr.json/translate?"
    private let API_KEY = "API_KEY"
    private let LANGS:String = "en-it"
    
    private var sentence:String
    
    init(sentence:String){
        
        self.sentence = sentence
        
    }
    
    private func formatSentence(text:String) -> String {
        
        return text.stringByReplacingOccurrencesOfString(" ", withString: "+")
        
    }
    
    func loadData() {
        
        let api = URL + "key=" + API_KEY + "&lang=" + LANGS + "&text=" + formatSentence(sentence)
        
        Alamofire.request(.GET, api)
            .responseJSON { request, response, result in
                
                let jsonJoke = JSON(result.value!)
                
                let defaultCenter = NSNotificationCenter.defaultCenter()
                defaultCenter.postNotificationName("jokeTranslated", object: String(jsonJoke["text"][0]))
                
        }
        
    }
    
}
