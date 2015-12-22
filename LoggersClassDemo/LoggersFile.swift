//
//  LoggersFile.swift
//  LoggersClassDemo
//
//  Created by Sushil Mishra on 12/22/15.
//  Copyright © 2015 Sushil Mishra. All rights reserved.
//

import Foundation

#if DEBUG
    //This will runs only in Debug case
    func DLog(message: AnyObject, file: String = __FUNCTION__, function: String = __FILE__, line: Int = __LINE__, column: Int = __COLUMN__) {
        //println("\(file) : \(function) : \(line) : \(column) - \(message)")
    }
#else
    func DLog(message: AnyObject, file: String = __FUNCTION__, function: String = __FILE__, line: Int = __LINE__, column: Int = __COLUMN__) {
        //
        print("\n\n\(NSDate())::  \(file) : \(function) : \(line) : \(column) ::\n \(message)")
       
        let logStr = "\n\n\(NSDate())::  \(file) : \(function) : \(line) : \(column) ::\n \(message)"
        
        
        
        let allPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = allPaths.first!
        let todaysDate:NSDate = NSDate()
        let styler = NSDateFormatter()
        styler.dateFormat = "ddMMMyyyy"
        let fileName = NSString(format: "%@.log",styler.stringFromDate(todaysDate))
        let pathForLog = documentsDirectory.stringByAppendingString("/\(fileName)")
        let checkValidation = NSFileManager.defaultManager()
        
        if (checkValidation.fileExistsAtPath(pathForLog))
        {
            do{
            try logStr.writeToFile(pathForLog, atomically: true, encoding: NSUTF8StringEncoding)
            }
            catch{
            
            }
        }
        else
        {
            
        }
        
        
        
        //NSLog("\(file) : \(function) : \(line) : \(column) - \(message)")
    }
#endif

//This will runs in all case
func ALog(message: AnyObject, file: String = __FUNCTION__, function: String = __FILE__, line: Int = __LINE__, column: Int = __COLUMN__) {
    print("\(file) : \(function) : \(line) : \(column) - \(message)")
}




class LoggersFile: NSObject {

    
    class func redirectConsoleLogIntoFile(){
    
        let allPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = allPaths.first!
        let todaysDate:NSDate = NSDate()
        let styler = NSDateFormatter()
        styler.dateFormat = "ddMMMyyyy"
        let fileName = NSString(format: "%@.log",styler.stringFromDate(todaysDate))
        let pathForLog = documentsDirectory.stringByAppendingString("/\(fileName)")
        
        print("path for log  -->\(pathForLog)")
       
        
        
        freopen(pathForLog.cStringUsingEncoding(NSASCIIStringEncoding)!, "a+", stderr)
        
        
    }
    
}
