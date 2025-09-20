//
//  TitleAndTaglineView.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI

extension MovieDetailScreen {
    struct TitleAndTaglineView: View {
        @EnvironmentObject var controller: MovieDetailController
        @Environment(\.transitionNamespace) var namespace

        private var data: MovieDetail { controller.data }

        var body: some View {
            VStack(alignment: .leading, spacing: 4) {
                Text(data.title)
                    .font(.largeTitle.bold())
                    .foregroundStyle(.primary)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .matchedTransitionSource(
                        id: .title(data.id),
                        namespace: namespace
                    )

                Text(data.tagline)
                    .font(.subheadline.italic())
                    .foregroundColor(.secondary)
                    .opacity(data.tagline.isEmpty == false ? 1 : 0)
                    .redacted(reason: controller.isLoading ? .placeholder : [])
            }
        }
    }
}
