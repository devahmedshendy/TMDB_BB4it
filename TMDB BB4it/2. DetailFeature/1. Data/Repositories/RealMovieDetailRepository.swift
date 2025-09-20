//
//  RealMovieDetailRepository.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

struct RealMovieDetailRepository: MovieDetailRepository {

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

    func getMovieDetail(id: Int) async throws -> MovieDetail {
        let request = MovieDetailRequest(id: id)

        let result = try await api.get(request)

        return .init(from: result)
    }

    func cacheImages(for response: MovieDetail) async throws {
        await withThrowingTaskGroup(of: Void.self) { group in
            for company in response.companies {
                guard let logoURL = company.logoURL else { return }

                group.addTask {
                    try await self.cache.cacheInMemory(
                        from: logoURL
                    )
                }
            }
        }
    }
}
