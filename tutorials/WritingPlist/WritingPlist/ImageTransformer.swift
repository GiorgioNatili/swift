//
//  ImageTransformer.swift
//  WritingPlist
//
//  Created by Giorgio Natili on 10/8/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit

class ImageTransformer: NSValueTransformer {
    
    override class func transformedValueClass() -> AnyClass {
        
        return NSData.self
    
    }
    
    override class func allowsReverseTransformation() -> Bool {
        
        return true
        
    }
    
    override func reverseTransformedValue(value: AnyObject?) -> AnyObject? {
        
        if let data = value as? NSData {
            return UIImage(data: data)
        }
        
        return nil
    }
    
    override func transformedValue(value: AnyObject?) -> AnyObject? {
        
        if let image = value as? UIImage {
            return UIImagePNGRepresentation(image)
        }
        
        return nil
    }
    
}
