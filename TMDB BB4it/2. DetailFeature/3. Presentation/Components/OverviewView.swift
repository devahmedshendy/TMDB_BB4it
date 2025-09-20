//
//  OverviewView.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI

extension MovieDetailScreen {
    struct OverviewView: View {
        @EnvironmentObject var controller: MovieDetailController
        @Environment(\.transitionNamespace) var namespace

        private var data: MovieDetail { controller.data }

        var body: some View {
            VStack(alignment: .leading, spacing: 12) {
                Text(String.text.Overview)
                    .font(.title2.bold())

                Text(data.overview)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
        }
    }
}
