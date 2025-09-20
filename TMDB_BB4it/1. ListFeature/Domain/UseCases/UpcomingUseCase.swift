//
//  UpcomingUseCase.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import Foundation

struct UpcomingUseCase: MovieListUseCase {
    private let repository: MovieListRepository

    init(repository: MovieListRepository) {
        self.repository = repository
    }

    func execute(page: Int) async throws -> MovieListResult {
        let result = try await repository.getMovieList(path: .upcoming, page: page)

        try await repository.cacheImages(for: result)

        return result
    }
}
