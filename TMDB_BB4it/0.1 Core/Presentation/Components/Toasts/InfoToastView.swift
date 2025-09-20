//
//  SuccessMessageAlertScreen.swift
//  SYAQA-SA
//
//  Created by Ahmed Shendy on 20/02/2025.
//

import SwiftUI

struct InfoToastView: View, ToastViewProtocol {
    let message: String
    let iconName: String = "info.circle.fill"

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: iconName)
                .font(.title3)
                .foregroundColor(.secondary)

            Text(message)
                .font(.headline)
                .foregroundColor(.primary)

        }
        .padding(.vertical, 12)
        .padding(.horizontal, 20)
        .background(.regularMaterial, in: Capsule())
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 4)
        .padding(.horizontal)
    }
}
