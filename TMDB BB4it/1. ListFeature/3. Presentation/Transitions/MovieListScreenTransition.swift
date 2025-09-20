//
//  MovieListScreenTransition.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI

enum MovieListScreenTransitionID: Hashable {
    case posterImage(_ movieID: Int)
    case posterImageMask(_ movieID: Int)
    case title(_ movieID: Int)
    case releaseYear(_ movieID: Int)
}

extension View {
    @ViewBuilder
    func matchedTransitionSource(
        id: MovieListScreenTransitionID,
        namespace: Namespace.ID?,
        anchor: UnitPoint = .center,
        isSource: Bool = true
    ) -> some View {
        if let namespace = namespace {
            self.matchedGeometryEffect(
                id: id,
                in: namespace,
                anchor: .top,
                isSource: isSource
            )

        } else {
            self
        }
    }
}
