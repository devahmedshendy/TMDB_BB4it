//
//  EmptyContentView.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI

struct EmptyContentView: View {
    let data: EmptyContentData
    let onRetry: (() -> Void)?

    init(data: EmptyContentData, onRetry: @escaping () -> Void) {
        self.data = data
        self.onRetry = onRetry
    }

    init(data: EmptyContentData) {
        self.data = data
        self.onRetry = nil
    }

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: data.iconName)
                .font(.system(size: 50))
                .foregroundColor(.secondary)
                .padding(.bottom, 10)

            Text(data.title)
                .font(.title2.bold())
                .multilineTextAlignment(.center)

            Text(data.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Button {
                onRetry?()
            } label: {
                Text(String.button.TryAgain)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .padding(.horizontal, 40)
            .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
