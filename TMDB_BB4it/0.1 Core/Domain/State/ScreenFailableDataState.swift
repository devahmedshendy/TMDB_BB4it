//
//  ScreenDataState.swift
//  SYAQA-SA
//
//  Created by Ahmed Shendy on 20/02/2025.
//

import Foundation

enum ScreenFailableDataState<T> {
    case idle
    case ready(_ data: T)
    case error(_ error: ApplicationError)
}
