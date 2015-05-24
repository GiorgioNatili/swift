//
//  ViewController.swift
//  iFrameUrlDetection
//
//  Created by Natili, Giorgio on 5/6/15.
//  Copyright (c) 2015 Natili, Giorgio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

  private var timer:NSTimer!
  
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        webView.delegate = self;
                
    }
    
    override func viewDidAppear(animated: Bool) {
       
        super.viewDidAppear(animated)
        
        let url = NSBundle.mainBundle().URLForResource("A-container", withExtension:"html")
        let requestObj = NSURLRequest(URL: url!);
        
        webView.loadRequest(requestObj);

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: NSURLRequest handlers
    private func handleRequest(request: NSURLRequest){
        
        UIApplication.sharedApplication().openURL(NSURL(string: request.URL.absoluteString!)!)
        
    }
  
    func updateRecordingStatus() {
    
      timer.invalidate()
      timer = nil
      
      MHEURLProtocol.switchRecording(false)
    
    }
    
    // MARK: UIWebViewDelegate implementation
    func webView(webView: UIWebView!, didFailLoadWithError error: NSError!) {
        println("Webview fail with error \(error.code)");
    }
    
    func webView(webView: UIWebView!, shouldStartLoadWithRequest request: NSURLRequest!, navigationType: UIWebViewNavigationType) -> Bool {
        
        var externalContent:Bool
        var value = true
        
        if navigationType == .LinkClicked{
          
            externalContent = !contains(MHEURLProtocol.domainList(), request.URL.absoluteString!)
            value = externalContent
            
            if externalContent {
             
                handleRequest(request)
                
            }
            
            println(request.URL.absoluteString)
            println(request.mainDocumentURL?.absoluteString)
            println("externalContent ------> \(externalContent)")
            
        }
        
        return value
        
    }
    
    func webViewDidStartLoad(webView: UIWebView!) {
      
      // println("Webview started Loading")
      MHEURLProtocol.switchRecording(true)
      
    }
    
    func webViewDidFinishLoad(webView: UIWebView!) {
        
      println("\n ******** \n Webview did finish load \n \(webView.request?.URL.absoluteURL) \n ******** \n")
      
      if (timer != nil) {
        
        timer.invalidate()
        timer = nil
        
      }
      
      timer = NSTimer.scheduledTimerWithTimeInterval(0.3, target:self, selector: Selector("updateRecordingStatus"), userInfo: nil, repeats: false)
      
    }


}

