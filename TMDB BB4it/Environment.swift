//
//  Environment.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation


enum Environment {
    enum XcodeSecrets: String {
        case ACCESS_TOKEN
    }

    private static let infoDictionary: [String : Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Info.plist file not found")
        }
        return dict
    }()

    static var ACCESS_TOKEN: String = {
        let secret = XcodeSecrets.ACCESS_TOKEN

        guard let value = infoDictionary[secret.rawValue] as? String else {
            fatalError("\(secret.rawValue) not found in Info.plist")
        }
        return value
    }()
}
