//
//  ViewController.swift
//  DownloadDataFromWeb
//
//  Created by alex oh on 12/17/15.
//  Copyright © 2015 Alex Oh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL(string: "http://stackoverflow.com")
        
        let urlRequest = NSURLRequest(URL: url!)
        print(urlRequest)
        
        webView.loadRequest(urlRequest)
        
//        let task = NSURLSession.sharedSession().dataTaskWithRequest(urlRequest) { (data, response, error) -> Void in
//            
//            print(data)
//            print(response)
//            print(error)
//            if let urlContent = data {
//                
//                print(urlContent)
//                
//                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding) as! String
//                
//                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    
//                    self.webView.loadHTMLString(webContent, baseURL: nil)
//
//                    
//                })
//                
//                
//                
//            }
//            
//        }
    
    }

}

