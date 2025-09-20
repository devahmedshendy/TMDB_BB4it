//
//  MovieDetailRepository.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import Foundation

protocol MovieDetailRepository {
    func getMovieDetail(id: Int) async throws -> MovieDetail
    func cacheImages(for response: MovieDetail) async throws
}

extension MovieDetailRepository where Self == RealMovieDetailRepository {
    static func real(api: APIClient = .native()) -> Self {
        .init(api: api)
    }
}
