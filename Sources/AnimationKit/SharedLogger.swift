//
//  SharedLogger.swift
//
//
//  Created by Dimas on 24/12/23.
//

import OSLog

struct SharedLogger {
    static var logger = Logger(
        subsystem: "com.ashidiqi.AnimationKit",
        category: "AnimationKit"
    )
    
    static func warning(_ message: String) {
        logger.warning("\(message)")
    }
}
