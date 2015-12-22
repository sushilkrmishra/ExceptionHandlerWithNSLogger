//
//  ExceptionHandler.swift
//  LoggersClassDemo
//
//  Created by Sushil Mishra on 12/22/15.
//  Copyright © 2015 Sushil Mishra. All rights reserved.
//

import Foundation
class ExceptionHandler: NSObject{

    class var sharedInstance: ExceptionHandler {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: ExceptionHandler? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = ExceptionHandler()
        }
        return Static.instance!
    }
    override init() {
         super.init()
        registerToCatchExceptions()
    }
    
    func registerToCatchExceptions() {
    
        NSSetUncaughtExceptionHandler { exception in
            DLog("EXception Details Are \n\nExceptionName--> \(exception.name) \nReason -->\(exception.reason!)\n\(exception.description)")
            DLog(exception.callStackSymbols)
        }
    }
    
    
}