// Playground - noun: a place where people can play

import UIKit

var message = "Hello, playground"
var courtesy = "How are you today? 😄"

print("\(message) \(courtesy.lowercased())")

let label = UILabel(frame: CGRect(x: 0, y: 0, width: 320, height: 22))
label.text = "\(message) \(courtesy.lowercased())"
label
label.textColor = UIColor.orange
label.tintColor = UIColor.gray
label.layer.cornerRadius = 12
label

