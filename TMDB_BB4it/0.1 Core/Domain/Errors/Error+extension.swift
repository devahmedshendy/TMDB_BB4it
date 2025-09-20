//
//  Error+extension.swift
//  CoreModule
//
//  Created by Ahmed Shendy on 25/06/2025.
//  Copyright © 2025 Semicolon. All rights reserved.
//

import Foundation

extension Error {
    public func mapToApplicationError() -> ApplicationError {
        guard let error = self as? ApplicationError else {
            let nsError = self as NSError
            return ViewError.Unknown(nsError.debugDescription)
        }

        return error
    }
}
