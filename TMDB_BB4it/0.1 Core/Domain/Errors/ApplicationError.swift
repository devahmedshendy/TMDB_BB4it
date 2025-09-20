//
//  ApplicationError.swift
//  CoreModule
//
//  Created by Ahmed Shendy on 08/07/2024.
//  Copyright © 2024 Semicolon. All rights reserved.
//

import Foundation

public protocol ApplicationError: LocalizedError,
                                  CustomStringConvertible,
                                  CustomDebugStringConvertible {
    var identifier: String { get }
    var details: ErrorDetails { get }
}

public extension ApplicationError {
    var identifier: String {
        let typeName = String(describing: Self.self)
        if let caseName = Mirror(reflecting: self).children.first?.label {
            return "\(typeName) - \(caseName)"
        } else {
            return typeName
        }
    }

    var message: String { details.message }
    var debugMessage: String { details.debugMessage }

    var description: String { details.message }
    var debugDescription: String { details.debugMessage }
}

// MARK: ErrorDetails

public struct ErrorDetails {
    public let message: String
    public let debugMessage: String

    init(
        type: String,
        message: String,
        debugMessage: String? = nil
    ) {
        self.message = message
        self.debugMessage = "\(type) - \(debugMessage ?? message)"
    }
}
