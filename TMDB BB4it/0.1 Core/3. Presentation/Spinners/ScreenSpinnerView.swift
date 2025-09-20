//
//  ScreenSpinnerView.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI

struct ScreenSpinnerView: View {
    var body: some View {
        ZStack {
            ProgressView()
                .controlSize(.large)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

extension View {
    func screenSpinner(isLoading: Bool) -> some View {
        self.overlay {
            if isLoading {
                ScreenSpinnerView()
            }
        }
    }
}
