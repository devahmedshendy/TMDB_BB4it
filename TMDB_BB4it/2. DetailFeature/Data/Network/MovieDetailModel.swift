//
//  MovieDetailModel.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import Foundation

struct MovieDetailModel: Decodable {
    let id: Int
    let title: String
    let tagline: String
    let overview: String
    let vote_average: Double
    let runtime: Int
    let poster_url: URL
    let homepage_url: URL?
    let imdb_url: URL?
    let release_date: String
    let genres: [GenreModel]
    let production_companies: [ProductionCompanyModel]

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case tagline
        case overview
        case vote_average
        case runtime
        case poster_path
        case homepage_url = "homepage"
        case imdb_id
        case release_date
        case genres
        case production_companies
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.tagline = try container.decode(String.self, forKey: .tagline)
        self.overview = try container.decode(String.self, forKey: .overview)
        self.vote_average = try container.decode(Double.self, forKey: .vote_average)
        self.runtime = try container.decode(Int.self, forKey: .runtime)

        let poster_path = try container.decode(String.self, forKey: .poster_path)
        if let poster_url = URL(
            string: .httpUrl.tmdbPosterImageUrl + "\(poster_path)"
        ) {
            self.poster_url = poster_url
        } else {
            throw DecodingError.dataCorruptedError(
                forKey: .poster_path,
                in: container,
                debugDescription: .error.URLDecodingFromPath(path: poster_path)
            )
        }

        self.homepage_url = try? container.decodeIfPresent(URL.self, forKey: .homepage_url)

        if let imdb_id = try? container.decodeIfPresent(String.self, forKey: .imdb_id) {
            if let imdb_url = URL(string: .httpUrl.imdbMovieUrl + "\(imdb_id)") {
                self.imdb_url = imdb_url
            } else {
                throw DecodingError.dataCorruptedError(
                    forKey: .imdb_id,
                    in: container,
                    debugDescription: .error.URLDecodingFromPath(path: imdb_id)
                )
            }
        } else {
            self.imdb_url = nil
        }

        self.genres = try container.decode([GenreModel].self, forKey: .genres)
        self.release_date = try container.decode(String.self, forKey: .release_date)
        self.production_companies = try container.decode([ProductionCompanyModel].self, forKey: .production_companies)
    }
}
