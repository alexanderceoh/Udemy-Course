//
//  ViewController.swift
//  JSON Example
//
//  Created by alex oh on 12/20/15.
//  Copyright © 2015 Alex Oh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL(string: "http://ip-api.com/json")

        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
            
            if let urlContent = data {
                
                // now we have to convert the urlContent and convert it into readable data
                
                
                // this also works

//                let jsonResult = try? NSJSONSerialization.JSONObjectWithData(urlContent, options: .MutableContainers)
//                
//                print(jsonResult)
                
                do {
                    
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(urlContent, options: .MutableContainers)
                    
                    print(jsonResult)
                    
                } catch {
                
                    print("JSON failed")
                    
                }
                
            }
            
        }
        
        task.resume()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

