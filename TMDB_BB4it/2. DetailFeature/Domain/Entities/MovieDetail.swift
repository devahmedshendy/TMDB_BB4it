//
//  MovieDetail.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import Foundation

struct MovieDetail {
    let id: Int
    let title: String
    let tagline: String
    let overview: String
    let posterURL: URL
    let runtime: Int
    let voteAverage: Double
    let releaseYear: String
    let homepageURL: URL?
    let imdbURL: URL?
    let genres: [Genre]
    let companies: [ProductionCompany]
}

extension MovieDetail {
    init(from model: MovieDetailModel) {
        self.id = model.id
        self.title = model.title
        self.tagline = model.tagline
        self.overview = model.overview
        self.posterURL = model.poster_url
        self.runtime = model.runtime
        self.voteAverage = model.vote_average
        self.releaseYear = String(model.release_date.prefix(4))
        self.homepageURL = model.homepage_url
        self.imdbURL = model.imdb_url
        self.genres = model.genres.map(Genre.init)
        self.companies = model.production_companies.map(ProductionCompany.init)
    }
}
