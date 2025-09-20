//
//  MetadataBarView.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI

extension MovieDetailScreen {
    struct MetadataBarView: View {
        @EnvironmentObject var controller: MovieDetailController
        @Environment(\.transitionNamespace) var namespace

        private var data: MovieDetail { controller.data }

        var body: some View {
            HStack(alignment: .center) {
                InfoPillView(
                    title: "\(String(format: "%.1f", data.voteAverage))/10",
                    subTitle: "Rating"
                )

                Spacer()

                InfoPillView(
                    title: "\(data.runtime / 60)h \(data.runtime % 60)m",
                    subTitle: "Runtime"
                )

                Spacer()

                InfoPillView(title: data.releaseYear, subTitle: "Year")
            }
            .padding()
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 15))
        }
    }
}
