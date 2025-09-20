//
//  ScreenDataState.swift
//  SYAQA-SA
//
//  Created by Ahmed Shendy on 20/02/2025.
//

import Foundation

enum ScreenDataState<T> {
    case idle
    case ready(_ data: T)
}
