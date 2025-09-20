//
//  Spinner+Modifier.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI

extension View {
    func screenSpinner(isLoading: Bool) -> some View {
        self.overlay {
            if isLoading {
                ScreenSpinnerView()
            }
        }
    }
}
