//
//  GetNowPlayingMovieListRepository.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

protocol MovieListRepository {
    func getNowPlayingList(page: Int) async throws -> MoviePage
}

extension MovieListRepository where Self == RealMovieListRepository {
    static func real(api: APIClient = .native()) -> Self {
        .init(api: api)
    }
}
