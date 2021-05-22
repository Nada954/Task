//
//  ApplicationCoordinator.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import UIKit

final class ApplicationCoordinator {
    // MARK: - Properties

    let window: UIWindow
    lazy var characterGateway = APICharacterGateway()
    lazy var characterRepository = RealmRepository<MarvelCharacter>()
    lazy var characterUseCase = DefaultCharacterUseCase(gateway: characterGateway, repository: .init(characterRepository))
    lazy var rootViewController = UINavigationController()
    lazy var router = Router(navigationController: rootViewController)
    lazy var charactersCoordinator = CharactersCoordinator(router: router, characterUseCase: characterUseCase)

    // MARK: - Init / Deinit

    init(window: UIWindow) {
        self.window = window
    }
}

// MARK: - Coordinator

extension ApplicationCoordinator: Coordinator {
    func start() {
        window.rootViewController = router.toPresentable()
        charactersCoordinator.start()
        window.makeKeyAndVisible()
    }
}
