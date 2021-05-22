//
//  AbstractRepository.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation

protocol AbstractRepository {
    associatedtype Entity

    @discardableResult
    func save(entites: [Entity]) -> Promise<Void>
    func fetchAll() -> Promise<[Entity]>
}

extension AbstractRepository {
    func eraseToAnyRepository() -> AnyRepository<Entity> {
        .init(self)
    }
}

final class AnyRepository<E>: AbstractRepository {
    private typealias SaveAction = ([E]) -> Promise<Void>
    private typealias FetchAllAction = () -> Promise<[E]>

    private let saveAction: SaveAction
    private let fetchAllAction: FetchAllAction

    init<R: AbstractRepository>(_ repository: R) where R.Entity == E {
        self.saveAction = repository.save
        self.fetchAllAction = repository.fetchAll
    }

    @discardableResult
    func save(entites: [E]) -> Promise<Void> {
        saveAction(entites)
    }

    func fetchAll() -> Promise<[E]> {
        fetchAllAction()
    }
}
