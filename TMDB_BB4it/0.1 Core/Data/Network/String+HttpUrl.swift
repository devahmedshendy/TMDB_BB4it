//
//  String+HttpMethod.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

extension String {
    enum httpUrl { }
}

extension String.httpUrl {
    static var tmdbAPI: String { "https://api.themoviedb.org/3/" }
    static var tmdbPosterImageUrl: String { "https://image.tmdb.org/t/p/w500/" }
    static var tmdbProductionLogoUrl: String { "https://image.tmdb.org/t/p/w300/" }

    static var imdbMovieUrl: String { "https://www.imdb.com/title/" }
}
