//
//  MovieListTabView.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI

struct MovieListTabView: View {
    @State private var index = 0

    @StateObject var controller: MovieListTabController
    let noContentData: EmptyContentData
    let movieTapAction: (_ movie: Movie) -> Void

    var body: some View {
        NavigationStack {
            ZStack {
                switch self.controller.data {
                case .idle:
                    Color.clear

                case .ready(let data):
                    if data.isEmpty {
                        EmptyContentView(
                            data: noContentData,
                            onRetry: {
                                controller.getFirstPage()
                            }
                        )

                    } else {
                        readyView(movies: data.list)
                    }

                case .error(let error):
                    EmptyContentView(
                        data: .movieList(error: error),
                        onRetry: {
                            controller.getFirstPage()
                        }
                    )
                }
            }
            .background(
                Color(red: 0.1, green: 0.1, blue: 0.12)
                    .ignoresSafeArea()
            )
            .screenSpinner(isLoading: controller.isLoading)
            .screenToast(controller.$toast)

            .navigationTitle(controller.title)

        }
    }

    @ViewBuilder
    private func readyView(movies: [Movie]) -> some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer(minLength: 95)

            SnapCarousel(
                spacing: 40,
                trailingSpace: 125,
                index: $index,
                items: movies
            ) { movie in
                MovieCardView(movie: movie)
                    .onTapGesture {
                        movieTapAction(movie)
                    }
                    .onAppear {
                        print("on MovieCardView appeared: \(movie.title)")
                    }
                    .onChange(of: index) { index in
                        if movies[index].id == movie.id {
                            // Define how close to the end we should be.
                            let threshold = 10

                            // Calculate the index that should trigger the load.
                            let thresholdIndex = movies.index(movies.endIndex, offsetBy: -threshold)

                            // If the current centered index has passed the threshold, load the next page.
                            if index >= thresholdIndex {
                                print("getNextPage after: \(movie.title)")
                                controller.getNextPage()
                            }
                        }
                    }
            }
        }
    }
}
