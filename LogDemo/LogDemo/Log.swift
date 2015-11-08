//
//  Log.swift
//  Consumer
//
//  Created by Todd Hopkinson on 11/4/15.
//  Copyright © 2015 Todd Hopkinson. All rights reserved.
//

import Foundation

/**
    Log provides simple and convenient debug logging that conditionally compiles to function only on debug builds.

    - Setup: The precompile flag DEBUG can be set up under target build settings under 'Swift Compiler - Custom Flags' settings 'Other Swift Flags' using -DDEBUG under the Debug configuration. Unless DEBUG flag is present, log() and trace() methods will execute nothing ensuring no logging on a Release build.

    - Usage: 
        Log.debug("my custom message")
        // output: [DEBUG] file:function:line my custom message

    - Usage: 
        Log.trace()
        // output: [TRACE] file:function:line

*/
struct Log {
    
    private enum Level : String {
        case Trace = "[TRACE]"
        case Debug = "[DEBUG]"
    }
    
    // internal message log()
    private static func log(level: Level, @autoclosure _ message: () -> String, _ error: NSError? = nil, _ details: String) {
        if let error = error {
            print("\(level.rawValue) \(details) \(message()) with error \(error)")
        } else {
            print("\(level.rawValue) \(details) \(message())")
        }
    }
    
    // internal trace log()
    private static func log(level: Level, _ details: String) {
        print("\(level.rawValue) \(details)")
    }
    
    // formats details for console
    private static func details(file: String, function: String, line: UInt) -> String {
        let filename = (file as NSString).lastPathComponent
        let details = "\(filename):\(function):\(line)"
        return details
    }

    
    // MARK: - Public Interface
    
    /**
        Logs custom message to the console
    
        - Parameters: String containing the cusom message you are logging
    
        - Usage: Log.debug("my custom message")
    */
    static func debug(@autoclosure message: () -> String, _ error: NSError? = nil, _ file: String = __FILE__, _ function: String = __FUNCTION__, _ line: UInt = __LINE__) {
        #if DEBUG
            let details = Log.details(file, function: function, line: line)
            log(.Debug, message, error, details)
        #endif
    }
    
    /**
        Logs trace to the console
    
        - Parameters: none
    
        - Usage: Log.trace()
    */
    static func trace(file: String = __FILE__, _ function: String = __FUNCTION__, _ line: UInt = __LINE__) {
        #if DEBUG
            let details = Log.details(file, function: function, line: line)
            log(.Trace, details)
        #endif
    }
}
