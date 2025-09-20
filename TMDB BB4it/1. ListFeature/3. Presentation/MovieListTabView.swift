//
//  MovieListTabView.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI
import Kingfisher

struct MovieListTabView: View {
    @State private var index = 0

    @StateObject var controller: MovieListTabController
    let noContentData: EmptyContentData

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

extension MovieListTabView {
    struct MovieCardView: View {
        let movie: Movie

        var body: some View {
            GeometryReader { geo in
                VStack(alignment: .center, spacing: 0) {
                    KFImage(movie.posterURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(
                            width: geo.size.width,
                            height: geo.size.height * 0.675,
                            alignment: .center
                        )
                        .cornerRadius(25)

                    Spacer().frame(height: 25)

                    Text(movie.title)
                        .font(.largeTitle)
                        .foregroundStyle(.primary)
                        .lineLimit(3)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .fixedSize(horizontal: false, vertical: true)

                    Spacer().frame(height: 9)

                    Text(movie.releaseDate)
                        .font(.largeTitle)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .fixedSize(horizontal: true, vertical: true)

                    Spacer()
                }
            }
        }
    }
}
