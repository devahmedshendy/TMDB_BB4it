//
//  Task+extension.swift
//  CoreModule
//
//  Created by Ahmed Shendy on 01/07/2025.
//

import Foundation

public extension Task where Success == Never, Failure == Never {
    static var isNotCancelled: Bool {
        self.isCancelled == false
    }
}
