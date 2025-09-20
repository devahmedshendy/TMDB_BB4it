//
//  MovieCardView.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI
import Kingfisher

extension MovieListTabView {
    struct MovieCardView: View {
        @Environment(\.transitionNamespace) var namespace

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
                        .matchedTransitionSource(
                            id: .posterImage(movie.id),
                            namespace: namespace
                        )
                        .mask(
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .matchedTransitionSource(
                                    id: .posterImageMask(movie.id),
                                    namespace: namespace
                                )
                        )

                    Spacer().frame(height: 25)

                    Text(movie.title)
                        .font(.largeTitle)
                        .foregroundStyle(.primary)
                        .lineLimit(3)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .fixedSize(horizontal: false, vertical: true)
                        .matchedTransitionSource(
                            id: .title(movie.id),
                            namespace: namespace
                        )

                    Spacer().frame(height: 9)

                    Text(movie.releaseYear)
                        .font(.largeTitle)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .fixedSize(horizontal: true, vertical: true)
                        .matchedTransitionSource(
                            id: .releaseYear(movie.id),
                            namespace: namespace
                        )

                    Spacer()
                }
            }
        }
    }
}
