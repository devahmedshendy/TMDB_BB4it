//
//  SpinnerModifier.swift
//  SYAQA-SA
//
//  Created by Ahmed Shendy on 20/02/2025.
//  Copyright © 2025 Semicolon. All rights reserved.
//

import SwiftUI

extension View {
    func spinner(isLoading: Bool) -> some View {
        self.overlay {
            if isLoading {
                ZStack {
                    ProgressView()
                        .controlSize(.large)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
