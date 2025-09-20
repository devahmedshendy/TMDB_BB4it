//
//  BaseController.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

@MainActor
class BaseController: ObservableObject {

    // MARK: States

    @Published
    private(set) var isLoading: Bool = false

    @Published
    private(set) var isLoadingMore: Bool = false

    // MARK: Lifecycle

    deinit {
        // TODO: setup basic logger
//        deinitLog(Self.self)
    }

    // MARK: State Mutators

    // isLoading

    func onStartLoading() {
        self.isLoading = true
    }

    func onStopLoading() {
        self.isLoading = false
    }

    // isLoadingMore

    func onStartLoadingMore() {
        isLoadingMore = true
    }

    func onStopLoadingMore() {
        isLoadingMore = false
    }
}
