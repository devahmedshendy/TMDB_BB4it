//
//  MovieDetailController.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

final class MovieDetailController: BaseController {

    // MARK: States

    @Published var data: MovieDetail

    // MARK: Properties

    private lazy var tasks: [String : Task<Void, Never>] = [:]
    private let useCase: MovieDetailUseCase

    // MARK: Lifecycle

    init(movie: Movie, useCase: MovieDetailUseCase) {
        self.data = .placeholder(from: movie)
        self.useCase = useCase
        super.init()

        getMovieDetail()
    }

    func getMovieDetail() {
        func onStartLoadingMovieDetail() {
            self.onStartLoading()
        }

        func onSuccessLoadingFirstPage(result: MovieDetail) {
            guard Task.isNotCancelled else { return }

            self.data = result
            self.onStopLoading()
        }

        func onFailedLoadingFirstPage(error: Error) {
            guard Task.isNotCancelled else { return }

            self.onLoadingFailure(error.mapToApplicationError())
        }

        func run() {
            tasks[#function]?.cancel()
            tasks[#function] = nil
            tasks[#function] = Task { [weak self] in
                do {
                    onStartLoadingMovieDetail()

                    guard let data = self?.data else { return }

                    let result = try await self?.useCase.execute(id: data.id)

                    guard let result else { return }

                    onSuccessLoadingFirstPage(result: result)

                } catch {
                    onFailedLoadingFirstPage(error: error)
                }
            }
        }

        run()
    }
}
