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

    // MARK: Lifecycle

    init(api: APIClient = .native()) {
        self.api = api
    }

    // MARK: Logic

    func getNowPlayingList(page: Int) async throws -> MoviePage {
        let request = NowPlayingMovieListRequest(page: page)

        let result = try await api.get(request)

        return .init(from: result)
    }
}
