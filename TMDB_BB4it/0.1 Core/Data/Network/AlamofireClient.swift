//
//  AlamofireClient.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

struct AlamofireClient: APIClient {
    func get<T>(_ request: T) async throws -> T.Response where T : APIRequest {
        fatalError()
    }
}
