//
//  Controller.swift
//  Login&Registration
//
//  Created by BridgeLabz on 19/08/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit

class Controller: NSObject {
    
    //saving data in Plist
    func savePlistData(userName : String, userPassword : String)
    {
        var paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentsDirectory:AnyObject = paths[0]
        let path = documentsDirectory.stringByAppendingPathComponent("samplePlist.plist")
        let fileManager = NSFileManager.defaultManager()
        let fileExists:Bool = fileManager.fileExistsAtPath(path)
        var data : NSMutableDictionary?
        
        //Check if plist file exists at path specified
        if fileExists == false
        {
            //File does not exists
            data = NSMutableDictionary () //Create data dictionary for storing in plist
        }
        else
        {
            //File exists – retrieve data from plist inside data dictionary
            data = NSMutableDictionary(contentsOfFile: path)
        }
        data?.setValue(userPassword, forKey: userName)
        data?.writeToFile(path, atomically: true) //Write data to file permanently

        return
    }
    
    //reading data from Plist
    func readPlistData(userName: String) -> String
    {
        var paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentsDirectory:AnyObject = paths[0]
        let path = documentsDirectory.stringByAppendingPathComponent("samplePlist.plist")
        
        //Retrieve contents from file at specified path
        let data = NSMutableDictionary(contentsOfFile: path)
       // print(path)
        //print(data?.objectForKey(userName))
        return (data?.objectForKey(userName))! as! String

    }

}
