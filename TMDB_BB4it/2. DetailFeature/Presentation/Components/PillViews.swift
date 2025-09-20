//
//  InfoPillView.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI

extension MovieDetailScreen {
    struct InfoPillView: View {
        let title: String
        let subTitle: String
        var body: some View {
            VStack {
                Text(title).font(.headline)
                Text(subTitle).font(.caption).foregroundColor(.secondary)
            }
        }
    }

    struct GenrePillsView: View {
        @EnvironmentObject var controller: MovieDetailController
        @Environment(\.transitionNamespace) var namespace

        private var data: MovieDetail { controller.data }

        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(data.genres, id: \.id) { genre in
                        Text(genre.name)
                            .font(.caption)
                            .padding(.horizontal, 10).padding(.vertical, 5)
                            .background(.white.opacity(0.1), in: Capsule())
                            .overlay(Capsule().stroke(.white.opacity(0.2), lineWidth: 1))
                    }
                }
            }
        }
    }
}
