//
//  EmptyContentData.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import Foundation

struct EmptyContentData {
    let title: String
    let description: String
    let iconName: String
}

extension EmptyContentData {
    static var nowPlaying: Self {
        .init(
            title: .empty.NoNowPlayingMovieListAvailableTitle,
            description: .empty.NoNowPlayingMovieListAvailableDescription,
            iconName: "film.stack"
        )
    }

    static var upcoming: Self {
        .init(
            title: .empty.NoUpcomingMovieListAvailableTitle,
            description: .empty.NoUpcomingMovieListAvailableDescription,
            iconName: "calendar.badge.clock"
        )
    }

    static var popular: Self {
        .init(
            title: .empty.NoPopularMovieListAvailableTitle,
            description: .empty.NoPopularMovieListAvailableDescription,
            iconName: "wifi.exclamationmark"
        )
    }

    static func movieList(error: ApplicationError) -> Self {
        .init(
            title: .empty.MovieListErrorTitle,
            description: error.message,
            iconName: "wifi.exclamationmark"
        )
    }
}
