//
//  NowPlayingUseCase.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

struct NowPlayingUseCase: MovieListUseCase {
    private let repository: MovieListRepository

    init(repository: MovieListRepository) {
        self.repository = repository
    }

    func execute(page: Int) async throws -> MovieListResult {
        let result = try await repository.getMovieList(path: .nowPlaying, page: page)

        try await repository.cacheImages(for: result)

        return result
    }
}
