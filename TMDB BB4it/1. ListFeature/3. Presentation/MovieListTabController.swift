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
        guard isLoadingMore == false, tasks[#function] == nil else { return }

        print("👉 loadNextPage")
        tasks[#function]?.cancel()
        tasks[#function] = nil
        tasks[#function] = Task { [weak self] in
            do {
                guard case let .ready(moviePage) = self?.data else { return }

                self?.onStartLoadingMore()

                let result = try await self?.useCase.execute(
                    page: moviePage.page + 1
                )

                guard result?.isEmpty == false else { return }

                guard Task.isNotCancelled, var result else { return }

                result = moviePage.withNextPage(result)
                self?.data = .ready(result)

//                print(nextMoviePage)

                self?.onStopLoadingMore()

            } catch {
                print((error as NSError).debugDescription)
                self?.onStopLoadingMore()
            }
        }
    }
}
