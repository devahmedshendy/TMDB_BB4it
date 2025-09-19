//
//  DatedMovieList.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

// Request

struct NowPlayingMovieListRequest: TMDBAPIRequest {
    typealias Response = DatedMovieListResponse

    var page: Int

    var path: String { "movie/now_playing" }
    var params: [String : String] {
        [
            "language": "en-US",
            "page": "\(page)"
        ]
    }
    var method: String { .httpMethod.GET }
}

struct UpcomingMovieListRequest: TMDBAPIRequest {
    typealias Response = DatedMovieListResponse

    var page: Int

    var path: String { "movie/upcoming" }
    var params: [String : String] {
        [
            "language": "en-US",
            "page": "\(page)"
        ]
    }
    var method: String { .httpMethod.GET }
}

// Response

struct DatedMovieListResponse: Decodable, MovieListResponse {
    let dates: Dates
    let page: Int
    let results: [MovieModel]
    let total_pages: Int
    let total_results: Int

    enum CodingKeys: CodingKey {
        case dates, page, results, total_pages, total_results
    }
}

extension DatedMovieListResponse {
    struct Dates: Decodable {
        let minimum: String
        let maximum: String

        enum CodingKeys: CodingKey {
            case minimum, maximum
        }
    }
}
