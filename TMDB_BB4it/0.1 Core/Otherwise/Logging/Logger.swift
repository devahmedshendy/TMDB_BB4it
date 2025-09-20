//
//  Logger.swift
//  CoreModule
//
//  Created by Ahmed Shendy on 24/06/2024.
//  Copyright © 2024 Semicolon. All rights reserved.
//

import Foundation
import OSLog

public func infoLog(
    _ object: Any...,
    fileID: String = #fileID,
    function: String = #function,
    line: Int = #line
) {
    Logger.standard.info(
        "\(formatted(object, fileID: fileID, function: function, line: line))"
    )
}

public func debugLog(
    _ object: Any...,
    fileID: String = #fileID,
    function: String = #function,
    line: Int = #line
) {
    Logger.standard.debug(
        "\(formatted(object, fileID: fileID, function: function, line: line))"
    )
}

public func debugJSON(
    _ data: Data,
    fileID: String = #fileID,
    function: String = #function,
    line: Int = #line
) {
#if DEBUG
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted

    if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
       let data = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
       let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
        Logger.standard.debug(
            "\(formatted(string, fileID: fileID, function: function, line: line))"
        )
    }
#else
#endif
}

public func errorLog(
    _ object: Any...,
    fileID: String = #fileID,
    function: String = #function,
    line: Int = #line
) {
    Logger.standard.error(
        "\(formatted(object, fileID: fileID, function: function, line: line))"
    )
}

public func errorLog(
    _ error: Error,
    fileID: String = #fileID,
    function: String = #function,
    line: Int = #line
) {
    let message = (error as NSError).debugDescription
    Logger.standard.error(
        "\(formatted(message, fileID: fileID, function: function, line: line))"
    )
}

public func deinitLog(
    _ class: AnyObject
) {
    Logger.standard.debug("👉\tdeinit:\(String(describing: `class`.self))")
}

// MARK: Helpers

private func formatted(
    _ object: Any...,
    fileID: String = #fileID,
    function: String = #function,
    line: Int = #line
) -> String {
    let message = object
        .map { String(describing: $0) }
        .joined(separator: " | ")

    return "👉\t\(fileID):\(function):\(line)\n\(message)"
}

private extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier!
    static var standard = Logger(
        subsystem: subsystem,
        category: "Standard"
    )
}
