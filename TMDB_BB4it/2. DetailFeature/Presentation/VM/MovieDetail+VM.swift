//
//  MovieDetail.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import Foundation

extension MovieDetail {
    var displayCompanies: String {
        companies.map(\.name).joined(separator: ", ")
    }
}

extension MovieDetail {
    static func placeholder(from movie: Movie) -> Self {
        .init(
            id: movie.id,
            title: movie.title,
            tagline: .init(repeating: ".", count: 100),
            overview: .init(repeating: ".", count: 200),
            posterURL: movie.posterURL,
            runtime: 0000,
            voteAverage: 0.000,
            releaseYear: .init(repeating: ".", count: 4),
            homepageURL: nil,
            imdbURL: nil,
            genres: [],
            companies: []
        )
    }
}
