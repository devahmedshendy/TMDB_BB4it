//
//  GetNowPlayingMovieListRepository.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

protocol MovieListRepository {
    func getMovieList(path: MovieListPath, page: Int) async throws -> MovieListResult
    func cacheImages(for response: MovieListResult) async throws
}

extension MovieListRepository where Self == RealMovieListRepository {
    static func real(api: APIClient = .native()) -> Self {
        .init(api: api)
    }
}
