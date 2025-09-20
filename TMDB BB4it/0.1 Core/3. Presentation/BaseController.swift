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

    @Published
    private(set) var toast: String? = nil

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

    func onLoadingFailure(_ error: ApplicationError) {
        self.toast = error.message
        self.isLoading = false
    }

    // isLoadingMore

    func onStartLoadingMore() {
        self.isLoadingMore = true
    }

    func onStopLoadingMore() {
        self.isLoadingMore = false
    }

    func onLoadingMoreFailure(_ error: ApplicationError) {
        self.toast = error.message
        self.isLoadingMore = false
    }
}
