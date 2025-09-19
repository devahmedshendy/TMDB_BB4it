//
//  NowPlayingUseCase.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

struct NowPlayingUseCase {
    private let repository: MovieListRepository

    init(repository: MovieListRepository) {
        self.repository = repository
    }

    func execute(page: Int) async throws -> MoviePage {
        try await repository.getNowPlayingList(page: 1)
    }
}
