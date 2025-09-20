//
//  RealMovieListRepository.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

struct RealMovieListRepository: MovieListRepository {

    // MARK: Properties

    private let api: APIClient
    private let cache: ImageCacheClient

    // MARK: Lifecycle

    init(
        api: APIClient = .native(),
        cache: ImageCacheClient = .kingfisher
    ) {
        self.api = api
        self.cache = cache
    }

    // MARK: Logic

    func getMovieList(
        path: MovieListPath,
        page: Int
    ) async throws -> MovieListResult {
        let request = MovieListRequest(
            page: page,
            path: path.rawValue
        )

        let result = try await api.get(request)

        return .init(from: result)
    }

    func cacheImages(for response: MovieListResult) async throws {
        await withThrowingTaskGroup(of: Void.self) { group in
            for movie in response.list {
                group.addTask {
                    try await self.cache.cacheInMemory(
                        from: movie.posterURL
                    )
                }
            }
        }
    }
}
