//
//  MovieDetailUseCase.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import Foundation

struct MovieDetailUseCase {
    private let repository: MovieDetailRepository

    init(repository: MovieDetailRepository) {
        self.repository = repository
    }

    func execute(id: Int) async throws -> MovieDetail {
        let result = try await repository.getMovieDetail(id: id)

        try await repository.cacheImages(for: result)

        return result
    }
}
