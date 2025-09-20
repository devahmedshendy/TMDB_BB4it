//
//  TransitionNamespaceKey.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI

extension View {
    func transitionNamespace(_ data: Namespace.ID?) -> some View {
        self.environment(\.transitionNamespace, data)
    }
}
