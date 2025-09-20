//
//  MovieListResult.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

struct MovieListResult: Hashable {
    let page: Int
    let list: [Movie]
    let totalPages: Int
    let totalCount: Int

    var isEmpty: Bool { list.isEmpty }

    func withNextResult(_ nextResult: MovieListResult) -> Self {
        .init(
            page: nextResult.page,
            list: self.list + nextResult.list,
            totalPages: nextResult.totalPages,
            totalCount: nextResult.totalCount
        )
    }
}

extension MovieListResult {
    init(from response: MovieListResponse) {
        self.page = response.page
        self.list = response.results.map(Movie.init(from:))
        self.totalPages = response.total_pages
        self.totalCount = response.total_results
    }
}
