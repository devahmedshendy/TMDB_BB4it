//
//  PosterHeaderView.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI
import Kingfisher

extension MovieDetailScreen {
    struct PosterHeaderView: View {
        @EnvironmentObject var controller: MovieDetailController
        @Environment(\.transitionNamespace) var namespace

        private var data: MovieDetail { controller.data }

        var body: some View {
            KFImage(data.posterURL)
                .resizable()
                .scaledToFit()
                .matchedTransitionSource(
                    id: .posterImage(data.id),
                    namespace: namespace
                )
                .overlay(
                    LinearGradient(
                        colors: [.clear, Color(red: 0.1, green: 0.1, blue: 0.12)],
                        startPoint: .center,
                        endPoint: .bottom)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 0, style: .continuous)
                        .matchedTransitionSource(
                            id: .posterImageMask(data.id),
                            namespace: namespace
                        )
                )
        }
    }
}
