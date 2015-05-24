import UIKit
import CoreData

var requestCount:Int = 0
var recording:Bool = true

let currentDomains = NSMutableSet()
let whiteList:Dictionary = [
  "main":   "webplatform.com",
  "assets": "assets.mheducation.com",
  "video":  "video.mehducation.com"
]
// To be used for an eventual caching strategy
let protocol_key = "McGrawHillWebViewRequests"

class MHEURLProtocol: NSURLProtocol {
  
  var connection: NSURLConnection!
  var mutableData: NSMutableData!
  var response: NSURLResponse!
  
  private class func pushDomain(domain:String) {
    
    if !isWhiteListed(domain) {
      
      currentDomains.addObject(domain)
      
    }
    
  }
  
  private class func isWhiteListed(url:String) -> Bool {
    
    var value = false
    
    for domain in whiteList {
      
      if url == domain.1 {
        
        value = true
        break
        
      }
      
    }
    
    return value
    
  }
  
  override class func canInitWithRequest(request: NSURLRequest) -> Bool {
    
    println("Request #\(requestCount++): URL = \(request.URL.absoluteString)\n")
    
    if recording {
      
      pushDomain(request.URL.absoluteString!)
      
      // Avoid unnecessary requests
      if NSURLProtocol.propertyForKey(protocol_key, inRequest: request) != nil {
        return false
      }
      
    }
    
    return true
    
  }
  
  override class func canonicalRequestForRequest(request: NSURLRequest) -> NSURLRequest {
    return request
  }
  
  override class func requestIsCacheEquivalent(aRequest: NSURLRequest, toRequest bRequest: NSURLRequest) -> Bool {
    return super.requestIsCacheEquivalent(aRequest, toRequest:bRequest)
  }
  
  override func startLoading() {
    
    println("Serving response from NSURLConnection")
    
    var newRequest = self.request.mutableCopy() as NSMutableURLRequest
    NSURLProtocol.setProperty(true, forKey: protocol_key, inRequest: newRequest)
    self.connection = NSURLConnection(request: newRequest, delegate: self)
    
  }
  
  override func stopLoading() {
    
    if self.connection != nil {
      
      self.connection.cancel()
      
    }
    
    self.connection = nil
    
  }
  
  // MARK: public static methods
  class func switchRecording (status:Bool) {
    
    recording = status
    
  }
  
  class func domainList() -> [String] {
    
    return currentDomains.allObjects as [String]
    
  }
  
  // MARK: public interface
  func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
    
    self.client!.URLProtocol(self, didReceiveResponse: response, cacheStoragePolicy: .NotAllowed)
    
    self.response = response
    self.mutableData = NSMutableData()
    
  }
  
  func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
    
    self.client!.URLProtocol(self, didLoadData: data)
    self.mutableData.appendData(data)
    
  }
  
  func connectionDidFinishLoading(connection: NSURLConnection!) {
    
    self.client!.URLProtocolDidFinishLoading(self)
    
  }
  
  func connection(connection: NSURLConnection!, didFailWithError error: NSError!) {
    
    self.client!.URLProtocol(self, didFailWithError: error)
    
  }
  
}