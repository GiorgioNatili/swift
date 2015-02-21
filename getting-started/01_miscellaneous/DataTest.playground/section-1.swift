// Playground - noun: a place where people can play

import UIKit
import Foundation
import XCPlayground

var str = "Hello, playground"


XCPSetExecutionShouldContinueIndefinitely()

class RemoteAPI {
    // If you are working with Cocoa APIs you always receive a NSArray, which is not typified
    func getData(completionHandler: ((NSArray!, NSError!) -> Void)!) {
        let url: NSURL = NSURL(string: "http://itunes.apple.com/search?term=Turistforeningen&media=software")
        let ses = NSURLSession.sharedSession()
        let task = ses.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            if (error != nil) {
                return completionHandler(nil, error)
            }
            
            var error: NSError?
            let json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary
            
            if (error != nil) {
                return completionHandler(nil, error)
            } else {
                return completionHandler(json["results"] as [NSDictionary], nil)
            }
        })
        task.resume()
    }
}

var api = RemoteAPI()

api.getData({(data:NSArray!, error:NSError!) in

    if let results = data {
        
        for item in results {
            
            // we convert each key to a String
            var artistId = item["artistId"]
            var artistName = item["artistName"]
            
            // We grab the thumbnails
            var thummbs = item["screenshotUrls"]
            
        }
        
    }
    
})




// ==========================================





class ImageLoader{
    
    var request:NSURLRequest?
    var loader:NSURLConnection?
    var totalBytes:Float64?
    
    lazy var bytes:NSMutableData = NSMutableData()
    lazy var ratioLabel:UILabel = UILabel()
    
    init(path:String){
        
        // this is our remote end point (similar to URLRequest in AS3)
        request = NSURLRequest(URL: NSURL(string: path))
    
        // this is what creates the connection and dispatches the varios events to track progression, etc.
        loader = NSURLConnection(request: request!, delegate: self, startImmediately: true)
        
    }
    
    func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
        
        // we initialize our buffer
        bytes = NSMutableData()
    
        // we grab the total bytes expected to load
        totalBytes = Float64(response.expectedContentLength)
        
    }

    func connection(connection: NSURLConnection!, didReceiveData conData: NSData!) {
        
        // we append the bytes as they come in
        bytes.appendData(conData)
    
        // we calculate our ratio
        // we divide the loaded bytes with the total bytes to get the ratio, we mulitply by 100
        // note that we floor the value
        var ratio = floor((Float64(bytes.length) / totalBytes!) * 100)
    
        // we cast to Int to remove the decimal and concatenate with %
        ratioLabel.text = String (Int(ratio)) + " %"
    
    }


}


var loader = ImageLoader(path: "http://a4.mzstatic.com/us/r30/Purple2/v4/c9/c4/8e/c9c48ec0-a9f0-c312-1d9b-ddc4ee305f05/screen322x572.jpeg")




