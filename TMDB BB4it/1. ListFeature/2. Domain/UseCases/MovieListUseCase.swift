//
//  MovieListUseCase.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import Foundation

protocol MovieListUseCase {
    func execute(page: Int) async throws -> MovieListResult
}

extension MovieListUseCase where Self == NowPlayingUseCase {
    static var nowPlaying: Self { .init(repository: .real()) }
}

extension MovieListUseCase where Self == UpcomingUseCase {
    static var upcoming: Self { .init(repository: .real()) }
}

extension MovieListUseCase where Self == PopularUseCase {
    static var popular: Self { .init(repository: .real()) }
}
