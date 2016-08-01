//
//  GABeaver.swift
//  Journey
//
//  Created by Ben Bahrenburg on 5/2/16.
//  Copyright © 2016 bencoding.com. All rights reserved.
//

import Foundation
import SwiftyBeaver
import Google

public class GABeaver: BaseDestination {
  
    private let moduleID = 9998
    
    public var useNSLog = false
    public var Threshold: SwiftyBeaver.Level  = SwiftyBeaver.Level.Error
    public var GoogleAnalyticsKey: String?
    public var printToConsole: Bool = false
    
    override public var defaultHashValue: Int {return moduleID}
   
    private func createTracker(key: String) {
        GAI.sharedInstance().trackerWithTrackingId(key)
        GAI.sharedInstance().logger.logLevel = GAILogLevel.None
        GAI.sharedInstance().trackUncaughtExceptions = true
    }
    
    private func getTracker() -> GAITracker {
        return GAI.sharedInstance().defaultTracker
    }

    private func trackException(reason: String) {
        let exceptionDictionary = GAIDictionaryBuilder.createExceptionWithDescription(reason, withFatal: false)
        getTracker().send(exceptionDictionary.build() as [NSObject : AnyObject])
    }
    
    public init(googleAnalyticsKey: String, threshold: SwiftyBeaver.Level  = SwiftyBeaver.Level.Error, printToConsole: Bool = false ) {
        super.init()
        self.GoogleAnalyticsKey = googleAnalyticsKey
        self.Threshold = threshold
        self.printToConsole = printToConsole
        self.createTracker(googleAnalyticsKey)
    }
    
    private func performPrint(formattedString: String?) {
        if let str = formattedString {
            if useNSLog {
                NSLog(str)
            } else {
                print(str)
            }
        }
    }
    

    override public func send(level: SwiftyBeaver.Level, msg: String, thread: String,
                              path: String, function: String, line: Int) -> String? {
        
        let formattedString = super.send(level, msg: msg, thread: thread, path: path, function: function, line: line)
        guard level.rawValue >= self.Threshold.rawValue else {
            return formattedString
        }
        
        if let str = formattedString {
            self.trackException(str)
        }
        
        if self.printToConsole {
            self.performPrint(formattedString)
        }
        

        return formattedString
    }
}
