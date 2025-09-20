//
//  APIClient.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

// I made this protocol as I was going to provide Alamofire implementation since many wants it
protocol APIClient {
    func get<T: APIRequest>(_ request: T) async throws -> T.Response
}

extension APIClient where Self == NativeAPIClient {
    static func native(urlSession: URLSession = .shared) -> Self {
        .init(urlSession: urlSession)
    }
}

extension APIClient where Self == AlamofireClient {
    static func alamofire() -> Self {
        .init()
    }
}
