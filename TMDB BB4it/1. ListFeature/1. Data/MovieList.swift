//
//  MovieList.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

// Request

struct MovieListRequest: TMDBAPIRequest {
    typealias Response = MovieListResponse

    var page: Int

    var path: String
    var params: [String : String] {
        [
            "language": "en-US",
            "page": "\(page)"
        ]
    }
    var method: String { .httpMethod.GET }
}

// Response

struct MovieListResponse: Decodable {
    let page: Int
    let results: [MovieModel]
    let total_pages: Int
    let total_results: Int

    enum CodingKeys: CodingKey {
        case page, results, total_pages, total_results
    }
}
