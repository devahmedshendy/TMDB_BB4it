//
//  TransitionNamespaceKey.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 20/09/2025.
//

import SwiftUI

private struct TransitionNamespaceKey: EnvironmentKey {
    static var defaultValue: Namespace.ID? = nil
}

extension EnvironmentValues {
    var transitionNamespace: Namespace.ID? {
        get { self[TransitionNamespaceKey.self] }
        set { self[TransitionNamespaceKey.self] = newValue }
    }
}
