//
//  ViewController.swift
//  Download Images
//
//  Created by alex oh on 12/20/15.
//  Copyright © 2015 Alex Oh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL(string: "http://www.classicfights.net/Mike_Tyson.jpg")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
            
            if error != nil {
                
                print(error)
                
            } else {
                
                // saving the image to filepath using DocumentDirectory
                
                var documentsDirectory: String?
                
                var paths: [AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                
                if paths.count > 0 {
                    
                    documentsDirectory = paths[0] as? String
                    
                    let savePath = documentsDirectory! + "/tyson.jpg"
                    
                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                    
                    // we get a warning because we should never update the UI on a background thread, only the main thread. Therefore we are changing the code so that we change the imageView on the main thread instead.
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                        self.imageView.image = UIImage(named: savePath)
                        
//                        if let tyson = UIImage(data: data!) {
//                            
//                            self.imageView.image = tyson
//                            
//                        }
                        
                    })
                    
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

