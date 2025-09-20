//
//  ToastManager.swift
//  SYAQA-SA
//
//  Created by Ahmed Shendy on 06/05/2025.
//  Copyright © 2025 Semicolon. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - ToastPosition
public enum ToastPosition: Sendable {
    case top, bottom
}

// MARK: - ToastViewProtocol
public protocol ToastViewProtocol: View {
    /// Call inside your view to dismiss manually
    func dismiss()
}

public extension ToastViewProtocol {
    func dismiss() {
        Task { @MainActor in
            ToastManager.shared.dismissCurrentToast()
        }
    }
}

// MARK: - ToastManager
// source: unknown
@MainActor
public final class ToastManager: @unchecked Sendable {
    public static let shared = ToastManager()

    private let operationQueue: OperationQueue
    private var currentOperation: ToastOperation?

    private init() {
        operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 1
        operationQueue.qualityOfService = .userInteractive
    }

    /// Show a new toast. Cancels any active one.
    public func showToast<V: ToastViewProtocol>(
        toastView: V,
        duration: TimeInterval = 2.0,
        position: ToastPosition = .top,
        padding: CGFloat = 20
    ) {
        // cancel existing
        currentOperation?.cancel()

        let op = ToastOperation(
            view: AnyView(toastView),
            duration: duration,
            position: position,
            padding: padding
        )
        currentOperation = op
        operationQueue.addOperation(op)
    }

    /// Dismiss the current toast immediately.
    public func dismissCurrentToast() {
        currentOperation?.cancel()
    }
}

// MARK: - ToastOperation
private final class ToastOperation: Operation, @unchecked Sendable {
    override var isAsynchronous: Bool { true }

    private var _executing = false {
        willSet { willChangeValue(forKey: "isExecuting") }
        didSet  { didChangeValue(forKey: "isExecuting") }
    }
    override private(set) var isExecuting: Bool {
        get { _executing }
        set { _executing = newValue }
    }

    private var _finished = false {
        willSet { willChangeValue(forKey: "isFinished") }
        didSet  { didChangeValue(forKey: "isFinished") }
    }
    override private(set) var isFinished: Bool {
        get { _finished }
        set { _finished = newValue }
    }

    private let hostingController: UIHostingController<AnyView>
    private let duration: TimeInterval
    private let position: ToastPosition
    private let padding: CGFloat

    private var topConstraint: NSLayoutConstraint?
    private var bottomConstraint: NSLayoutConstraint?

    init(
        view: AnyView,
        duration: TimeInterval,
        position: ToastPosition,
        padding: CGFloat
    ) {
        self.hostingController = UIHostingController(rootView: view)
        self.duration = duration
        self.position = position
        self.padding = padding
        super.init()
    }

    override func start() {
        if isCancelled {
            finish()
            return
        }

        isExecuting = true
        Task { @MainActor in
            await showInWindow()
        }
    }

    @MainActor
    private func showInWindow() async {
        guard let window = Self.findKeyWindow() else {
            finish(); return
        }

        let toastView = hostingController.view!
        toastView.backgroundColor = .clear
        toastView.alpha = 0
        toastView.translatesAutoresizingMaskIntoConstraints = false
        window.addSubview(toastView)

        // horizontal
        NSLayoutConstraint.activate([
            toastView.leadingAnchor.constraint(equalTo: window.leadingAnchor, constant: padding),
            toastView.trailingAnchor.constraint(equalTo: window.trailingAnchor, constant: -padding)
        ])

        // vertical initial off-screen
        switch position {
        case .top:
            topConstraint = toastView.topAnchor.constraint(
                equalTo: window.safeAreaLayoutGuide.topAnchor,
                constant: -toastView.intrinsicContentSize.height
            )
            NSLayoutConstraint.activate([topConstraint!])
        case .bottom:
            bottomConstraint = toastView.bottomAnchor.constraint(
                equalTo: window.safeAreaLayoutGuide.bottomAnchor,
                constant: toastView.intrinsicContentSize.height
            )
            NSLayoutConstraint.activate([bottomConstraint!])
        }

        window.layoutIfNeeded()
        animateIn()
    }

    @MainActor
    private func animateIn() {
        let toastView = hostingController.view!
        UIView.animate(
            withDuration: 0.35,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                toastView.alpha = 1
                switch self.position {
                case .top:
                    self.topConstraint?.constant = 24
                case .bottom:
                    self.bottomConstraint?.constant = -24
                }
                toastView.superview?.layoutIfNeeded()
            },
            completion: { _ in
                Task { @MainActor in
                    // auto-dismiss after duration
                    try? await Task.sleep(nanoseconds: UInt64(self.duration * 1_000_000_000))
                    self.dismissToast(animated: true)
                }
            }
        )
    }

    @MainActor
    private func dismissToast(animated: Bool) {
        guard !isFinished else { return }
        let view = hostingController.view!
        let animations = {
            view.alpha = 0
            switch self.position {
            case .top:
                self.topConstraint?.constant = -view.bounds.height
            case .bottom:
                self.bottomConstraint?.constant = view.bounds.height
            }
            view.superview?.layoutIfNeeded()
        }

        let completion: (Bool) -> Void = { _ in
            view.removeFromSuperview()
            self.finish()
        }

        if animated {
            UIView.animate(
                withDuration: 0.3,
                delay: 0,
                options: .curveEaseIn,
                animations: animations,
                completion: completion
            )
        } else {
            animations()
            completion(true)
        }
    }

    override func cancel() {
        super.cancel()
        Task { @MainActor in
            dismissToast(animated: true)
        }
    }

    private func finish() {
        isExecuting = false
        isFinished = true
    }

    private static func findKeyWindow() -> UIWindow? {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
}
