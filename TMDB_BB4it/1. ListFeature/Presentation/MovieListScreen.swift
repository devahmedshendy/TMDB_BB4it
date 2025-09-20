//
//  MovieListScreen.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import SwiftUI

struct MovieListScreen: View {
    @Namespace var namespace
    @State private var selectedMovie: Movie?

    init() {
        setupTabBarAppearance()
        setupNavigationBarAppearance()
    }

    var body: some View {
        ZStack {
            TabView {
                MovieListTabView(
                    controller: .init(
                        title: .text.NowPlaying,
                        useCase: .nowPlaying
                    ),
                    noContentData: .nowPlaying,
                    movieTapAction: showMovieDetail
                )
                .nowPlayingTabItem()

                MovieListTabView(
                    controller: .init(
                        title: .text.Upcoming,
                        useCase: .upcoming
                    ),
                    noContentData: .upcoming,
                    movieTapAction: showMovieDetail
                )
                .upcomingTabItem()

                MovieListTabView(
                    controller: .init(
                        title: .text.Popular,
                        useCase: .popular
                    ),
                    noContentData: .popular,
                    movieTapAction: showMovieDetail
                )
                .popularTabItem()
            }
            .animation(.default, value: selectedMovie)
            .opacity(selectedMovie == nil ? 1.0 : 0.0)
            .transition(.opacity)

            if let movie = selectedMovie {
                MovieDetailScreen(
                    controller: .init(
                        movie: movie,
                        useCase: .init(repository: .real())
                    ),
                    dismiss: {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            self.selectedMovie = nil
                        }
                    }
                )
            }
        }
        .transitionNamespace(namespace)
    }

    // MARK: Helpers

    private func showMovieDetail(_ movie: Movie) {
        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
            self.selectedMovie = movie
        }
    }

    // MARK: UI Setup

    private func setupTabBarAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }

    private func setupNavigationBarAppearance() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithTransparentBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
}
