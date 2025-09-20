//
//  TMDBAPIRequest.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

protocol TMDBAPIRequest: APIRequest { }

extension TMDBAPIRequest {
    var headers: [String: String] { authHeaders }
}

extension TMDBAPIRequest {
    var api: URL { .init(string: .httpUrl.tmdbAPI)! }

    var authHeaders: [String : String] {
        [
            "accept": "application/json",
            "Authorization": "Bearer \(EnvironmentVariable.ACCESS_TOKEN)"
        ]
    }
}
