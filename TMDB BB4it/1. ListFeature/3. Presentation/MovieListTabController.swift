//
//  MovieListTabController.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

final class MovieListTabController: BaseController {

    // MARK: States

    @Published var data: ScreenFailableDataState<MovieListResult> = .idle
    let title: String

    // MARK: Properties

    private lazy var tasks: [String : Task<Void, Never>] = [:]
    private let useCase: MovieListUseCase

    // MARK: Lifecycle

    init(title: String, useCase: MovieListUseCase) {
        self.useCase = useCase
        self.title = title
        super.init()

        getFirstPage()
    }

    // MARK: Logic

    func getFirstPage() {
        func onStartLoadingFirstPage() {
            self.data = .idle
            self.onStartLoading()
        }

        func onSuccessLoadingFirstPage(result: MovieListResult) {
            guard Task.isNotCancelled else { return }

            self.data = .ready(result)
            self.onStopLoading()
        }

        func onFailedLoadingFirstPage(error: Error) {
            guard Task.isNotCancelled else { return }

            let error = error.mapToApplicationError()

            self.data = .error(error)
            self.onStopLoading()
        }

        func run() {
            tasks[#function]?.cancel()
            tasks[#function] = nil
            tasks[#function] = Task { [weak self] in
                do {
                    onStartLoadingFirstPage()

                    let result = try await self?.useCase.execute(page: 1)

                    guard let result else { return }

                    onSuccessLoadingFirstPage(result: result)

                } catch {
                    onFailedLoadingFirstPage(error: error)
                }
            }
        }

        run()
    }

    func getNextPage() {
        func onStartLoadingNextPage() {
            self.onStartLoadingMore()
        }

        func onSuccessLoadingNextPage(current: MovieListResult, next: MovieListResult) {
            guard Task.isNotCancelled else { return }

            let combined = current.withNextResult(next)
            self.data = .ready(combined)
            self.onStopLoadingMore()
        }

        func onFailedLoadingNextPage(error: Error) {
            guard Task.isNotCancelled else { return }

            self.onLoadingMoreFailure(error.mapToApplicationError())
        }

        func run() {
            guard isLoadingMore == false else { return }

            guard case let .ready(currentResult) = self.data else { return }
            guard currentResult.page < currentResult.totalPages else { return }

            tasks[#function]?.cancel()
            tasks[#function] = nil
            tasks[#function] = Task { [weak self] in
                do {
                    onStartLoadingNextPage()

                    let nextPageResult = try await self?.useCase.execute(
                        page: currentResult.page + 1
                    )

                    guard nextPageResult?.isEmpty == false else {
                        self?.onStopLoadingMore()
                        return
                    }

                    guard let nextPageResult else { return }

                    onSuccessLoadingNextPage(current: currentResult, next: nextPageResult)

                } catch {
                    onFailedLoadingNextPage(error: error)
                }
            }
        }

        run()
    }
}
