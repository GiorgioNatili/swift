//
//  Note.swift
//  WritingPlist
//
//  Created by Dmitry Shamis on 10/8/15.
//  Copyright © 2015 io.webplatform.swift. All rights reserved.
//

import UIKit
import Foundation
import CoreData

@objc(Note)
class Note: NSManagedObject {
    @NSManaged var title: String
    @NSManaged var info: String
}
