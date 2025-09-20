//
//  String+empty.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import Foundation

extension String.empty {
    static var NoNowPlayingMovieListAvailableTitle: String { "No Movies Playing" }
    static var NoNowPlayingMovieListAvailableDescription: String {
        "There are currently no movies to show. Please try again."
    }
    static var NoUpcomingMovieListAvailableTitle: String { "No Movies Announced" }
    static var NoUpcomingMovieListAvailableDescription: String {
        "New movie release dates haven't been announced yet. Check back soon!"
    }
    static var NoPopularMovieListAvailableTitle: String { "Couldn't Load Movies" }
    static var NoPopularMovieListAvailableDescription: String {
        "We had trouble fetching popular movies. Please check your connection and try again."
    }

    static var MovieListErrorTitle: String { "Couldn't Load Movies" }
}
