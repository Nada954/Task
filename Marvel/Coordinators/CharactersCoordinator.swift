//
//  CharactersCoordinator.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import UIKit

final class CharactersCoordinator {
    // MARK: - Properties

    private let router: Router
    private let characterUseCase: CharacterUseCase
    private lazy var mediaGateway = APIMarvelMediaGateway()
    private lazy var mediaRepository = RealmRepository<Media>()
    private lazy var mediaUseCase = DefaultMediaUseCase(gateway: mediaGateway, repository: .init(mediaRepository))
    private lazy var throttler = DefaultThrottler(minimumDelay: 0.5)

    // MARK: - Init / Deinit

    init(router: Router, characterUseCase: CharacterUseCase) {
        self.router = router
        self.characterUseCase = characterUseCase
    }
}

// MARK: - Coordinator

extension CharactersCoordinator: Coordinator {
    func start() {
        let controller = CharactersViewController.instantiate()
        controller.viewModel = CharactersViewModel(
            coordinator: self,
            characterUseCase: characterUseCase,
            throttler: throttler
        )
        router.push(controller, animated: true, completion: nil)
    }
}

// MARK: - CharactersViewControllerDelegate

extension CharactersCoordinator: CharactersCoordinatorDelegate {
    func didTapSearch() {
        let viewModel = CharactersViewModel(
            coordinator: self,
            characterUseCase: characterUseCase,
            throttler: throttler
        )
        let coordinator = SearchCoordinator(router: router, viewModel: viewModel)
        coordinator.start()
    }

    func didTapCancelSearch() {
        router.pop()
    }

    func didSelect(character: CharacterViewItem) {
        let coordinator = CharacterDetailsCoordinator(
            router: router,
            mediaUseCase: mediaUseCase,
            character: character
        )
        coordinator.start()
    }
}
