// Playground - noun: a place where people can play

import UIKit

var message = "Hello, playground"
var courtesy = "How are you today? 😄"

print(message + " " + courtesy.lowercaseString)

let label = UILabel(frame: CGRect(x: 0, y: 0, width: 320, height: 22))
label.text = message + " " + courtesy.lowercaseString
label
label.textColor = UIColor.orangeColor()
label.tintColor = UIColor.grayColor()
label.layer.cornerRadius = 12
label

