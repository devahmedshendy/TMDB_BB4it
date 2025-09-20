//
//  ExternalLinksView.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI

extension MovieDetailScreen {
    struct ExternalLinksView: View {
        @EnvironmentObject var controller: MovieDetailController
        @Environment(\.transitionNamespace) var namespace

        private var data: MovieDetail { controller.data }

        var body: some View {
            HStack {
                if let homepageURL = data.homepageURL {
                    Link(destination: homepageURL) {
                        Label(String.text.Website, systemImage: "safari.fill")
                            .font(.callout)
                    }
                    .buttonStyle(.bordered)
                    .tint(.secondary)
                }

                if let imdbURL = data.imdbURL {
                    Link(destination: imdbURL) {
                        Label(String.text.IMDb, systemImage: "link")
                            .font(.callout)
                    }
                    .buttonStyle(.bordered)
                    .tint(.secondary)
                }
            }
        }
    }
}
