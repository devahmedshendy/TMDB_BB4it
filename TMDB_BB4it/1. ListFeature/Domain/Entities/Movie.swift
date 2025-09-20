//
//  Movie.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

struct Movie {
    let id: Int
    let title: String
    let overview: String
    let posterURL: URL
    let releaseYear: String
}

extension Movie {
    init(from model: MovieModel) {
        self.id = model.id
        self.title = model.title
        self.overview = model.overview
        self.posterURL = model.poster_url
        self.releaseYear = String(model.release_date.prefix(4))
    }
}
