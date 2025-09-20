//
//  FooterView.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI

extension MovieDetailScreen {
    struct FooterView: View {
        @EnvironmentObject var controller: MovieDetailController
        @Environment(\.transitionNamespace) var namespace

        private var data: MovieDetail { controller.data }

        var body: some View {
            VStack(spacing: 8) {
                Divider().padding(.vertical)

                // Production company names
                Text(controller.data.displayCompanies)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)

                // Copyright
                Text("© \(controller.data.releaseYear) \(controller.data.title)")
                    .font(.caption)
                    .foregroundColor(.secondary)

                // TMDB Credit
                Text(String.text.TMDBCredit)
                    .font(.caption2)
                    .foregroundColor(.secondary.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
            }
            .padding(.horizontal)
            .padding(.bottom, 40)
        }
    }
}
