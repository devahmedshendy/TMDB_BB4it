//
//  MovieListTabController.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

final class MovieListTabController: BaseController {

    // MARK: States

    @Published var data: ScreenDataState<MovieListResult> = .idle
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
        tasks[#function]?.cancel()
        tasks[#function] = nil
        tasks[#function] = Task { [weak self] in
            do {
                self?.onStartLoading()
                let result = try await self?.useCase.execute(page: 1)

                guard Task.isNotCancelled, let result else { return }

                self?.data = .ready(result)
                print(result)

                self?.onStopLoading()

            } catch {
                print((error as NSError).debugDescription)
                self?.onStopLoading()
            }
        }
    }

    func getNextPage() {
        guard !isLoadingMore else { return }

        guard case let .ready(currentResult) = self.data else { return }
        guard currentResult.page < currentResult.totalPages else { return }

        print("👉 loadNextPage")
        tasks[#function]?.cancel()
        tasks[#function] = nil
        tasks[#function] = Task { [weak self] in
            do {

                self?.onStartLoadingMore()

                let nextPageResult = try await self?.useCase.execute(
                    page: currentResult.page + 1
                )

                guard nextPageResult?.isEmpty == false else { return }

                guard Task.isNotCancelled, let nextPageResult else { return }

                let combinedResult = currentResult.withNextResult(nextPageResult)
                self?.data = .ready(combinedResult)

                self?.onStopLoadingMore()

            } catch {
                print((error as NSError).debugDescription)
                self?.onStopLoadingMore()
            }
        }
    }
}
