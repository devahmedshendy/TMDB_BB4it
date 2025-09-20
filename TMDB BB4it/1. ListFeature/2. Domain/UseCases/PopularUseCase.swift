//
//  PopularUseCase.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import Foundation

struct PopularUseCase: MovieListUseCase {
    private let repository: MovieListRepository

    init(repository: MovieListRepository) {
        self.repository = repository
    }

    func execute(page: Int) async throws -> MovieListResult {
        try await repository.getMovieList(path: .popular, page: page)
    }
}
