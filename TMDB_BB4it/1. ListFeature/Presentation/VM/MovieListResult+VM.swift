//
//  MovieListResult.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import Foundation

extension MovieListResult: Hashable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.page == rhs.page
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(page)
        hasher.combine(totalPages)
        hasher.combine(totalCount)
    }
}

extension MovieListResult {
    var isEmpty: Bool { list.isEmpty }
}

extension MovieListResult {
    func withNextResult(_ nextResult: MovieListResult) -> Self {
        .init(
            page: nextResult.page,
            list: self.list + nextResult.list,
            totalPages: nextResult.totalPages,
            totalCount: nextResult.totalCount
        )
    }
}
