//
//  MovieDetail.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import Foundation

// Request

struct MovieDetailRequest: TMDBAPIRequest {
    typealias Response = MovieDetailModel

    var id: Int

    var path: String { "movie/\(id)" }
    var params: [String : String] {
        [ "language": "en-US" ]
    }
    var method: String { .httpMethod.GET }
}
