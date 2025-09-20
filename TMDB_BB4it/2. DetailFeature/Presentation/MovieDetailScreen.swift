//
//  MovieDetailScreen.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI
import Kingfisher

struct MovieDetailScreen: View {
    @Environment(\.transitionNamespace) var namespace
    @StateObject var controller: MovieDetailController
    var dismiss: () -> Void

    private var data: MovieDetail { controller.data }

    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(spacing: 24) {
                    PosterHeaderView()

                    VStack(alignment: .leading) {
                        TitleAndTaglineView()

                        Spacer().frame(height: 16)

                        MetadataBarView()
                            .redacted(reason: controller.isLoading ? .placeholder : [])

                        Spacer().frame(height: 22)

                        OverviewView()
                            .redacted(reason: controller.isLoading ? .placeholder : [])

                        Spacer().frame(height: 18)

                        GenrePillsView()
                            .redacted(reason: controller.isLoading ? .placeholder : [])

                        Spacer().frame(height: 18)

                        ExternalLinksView()
                            .redacted(reason: controller.isLoading ? .placeholder : [])

                        Spacer().frame(height: 22)

                        ProductionCompanyListView()
                            .redacted(reason: controller.isLoading ? .placeholder : [])

                        Spacer().frame(height: 35)

                        FooterView()
                            .redacted(reason: controller.isLoading ? .placeholder : [])
                    }
                    .padding(.horizontal)
                }
            }

            HStack {
                Spacer() // Pushes the button to the right

                Button(action: dismiss) {
                    Image(systemName: "xmark")
                        .font(.title2.weight(.bold))
                        .foregroundColor(.secondary)
                        .padding(10)
                        .background(.thinMaterial, in: Circle())
                }
                .padding(16)
                .padding(.top, 56)
            }
        }
        .ignoresSafeArea()
        .background(
            Color(red: 0.1, green: 0.1, blue: 0.12)
                .ignoresSafeArea()
        )

        .screenToast(controller.$toast)

        .transitionNamespace(namespace)
        .environmentObject(controller)
    }
}
