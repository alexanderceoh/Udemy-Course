//
//  ViewController.swift
//  Core Data Demo
//
//  Created by alex oh on 12/20/15.
//  Copyright © 2015 Alex Oh. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let appDel = UIApplication.sharedApplication().delegate as? AppDelegate
        let context = appDel?.managedObjectContext
        
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context!)
        
        newUser.setValue("Rob", forKey: "username")
        newUser.setValue("pass123", forKey: "password")
        
        do {
            try context?.save()
        } catch {
            print("There was a problem")
        }
        
        let request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "username = %@", "Tommy")
        
        do {
            let results = try context?.executeFetchRequest(request)
            
            if results?.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    result.setValue("Ralphie", forKey: "username")
                    
                    do {
                        try context?.save()
                    } catch {
                        print("There was a problem")
                    }
                    
                    if let username = result.valueForKey("username") as? String {
                    
                        print(username)
                    
                    }
                }
                
            }
            print(results)
        } catch {
            print("Fetch Failed")
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

