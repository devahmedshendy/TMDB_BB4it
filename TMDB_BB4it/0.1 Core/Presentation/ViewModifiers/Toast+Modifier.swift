//
//  Toast+Modifier.swift
//  TMDB_BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI
import Combine

extension View {
    func screenToast<P>(_ publisher: P) -> some View where P : Publisher, P.Output == String?, P.Failure == Never {
        self.onReceive(publisher) { message in
            if let message = message {
                let view = InfoToastView(
                    message: message
                )

                ToastManager.shared.showToast(
                    toastView: view,
                    duration: 2,
                    position: .bottom
                )
            }
        }
    }
}
