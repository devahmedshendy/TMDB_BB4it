//
//  ProductionCompanyListView.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI
import Kingfisher

extension MovieDetailScreen {
    struct ProductionCompanyListView: View {
        @EnvironmentObject var controller: MovieDetailController
        @Environment(\.transitionNamespace) var namespace

        private var data: MovieDetail { controller.data }

        var body: some View {
            VStack(alignment: .leading, spacing: 12) {
                Text(String.text.Production)
                    .font(.title3.bold())

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(data.companies, id: \.id) { company in
                            KFImage(company.logoURL)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                                .colorInvert()
                                .redacted(reason: controller.isLoading ? .placeholder : [])
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.horizontal)
                }
            }

        }
    }
}
