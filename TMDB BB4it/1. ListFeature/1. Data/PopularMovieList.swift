//
//  PopularMovieList.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

// Request

struct PopularMovieListRequest: TMDBAPIRequest {
    typealias Response = PopularMovieListResponse

    var page: Int

    var path: String {
        "movie/popular?language=en-US&page=\(page)"
    }
    var params: [String : String] {
        [
            "language": "en-US",
            "page": "\(page)"
        ]
    }
    var method: String { .httpMethod.GET }
}

// Response

struct PopularMovieListResponse: Decodable, MovieListResponse {
    let page: Int
    let results: [MovieModel]
    let total_pages: Int
    let total_results: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case total_pages
        case total_results
    }
}
