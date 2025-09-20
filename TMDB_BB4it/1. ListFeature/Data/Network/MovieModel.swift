//
//  MovieModel.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

struct MovieModel: Decodable {
    let id: Int
    let title: String
    let overview: String
    let poster_url: URL
    let release_date: String
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case overview
        case poster_path
        case release_date
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.overview = try container.decode(String.self, forKey: .overview)

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


        self.release_date = try container.decode(String.self, forKey: .release_date)
    }
}
