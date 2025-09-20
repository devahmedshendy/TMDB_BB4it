//
//  ScreenDataState.swift
//  SYAQA-SA
//
//  Created by Ahmed Shendy on 20/02/2025.
//  Copyright © 2025 Semicolon. All rights reserved.
//

import Foundation

// TODO: remove all Hashable stuff
enum ScreenDataState<T: Hashable>: Hashable {
    case idle
    case ready(_ data: T)

    static func == (lhs: ScreenDataState<T>, rhs: ScreenDataState<T>) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle): return true
        case (.ready(let lhsData), .ready(let rhsData)): return lhsData == rhsData
        default: return false
        }
    }
}
