//
//  ListController.swift
//  TMDB BB4it
//
//  Created by Ahmed Shendy on 19/09/2025.
//

import Foundation

final class ListController: BaseController {

    // MARK: Properties

    private let useCase: NowPlayingUseCase

    // MARK: Lifecycle

    init(
        useCase: NowPlayingUseCase = .init(
            repository: .real()
        )
    ) {
        self.useCase = useCase
    }

    // MARK: Logic

    func onAppearTask() async {
        do {
            let list = try await useCase.execute(page: 1)
            print(list)
            
        } catch {
            print((error as NSError).debugDescription)
        }
    }
}
