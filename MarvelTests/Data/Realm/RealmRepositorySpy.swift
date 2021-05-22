//
//  RealmRepositorySpy.swift
//  MarvelTests
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation
@testable import Marvel

final class RealmRepositorySpy<Entity: IdentifiableEntity>: AbstractRepository {
    var entites = [Entity]()
    var savePromise: Promise<Void>!
    var saveCallCount = 0

    var fetchCallCount = 0
    var fetchPromise: Promise<[Entity]>!

    func save(entites: [Entity]) -> Promise<Void> {
        saveCallCount += 1
        self.entites = entites
        return savePromise
    }

    func fetchAll() -> Promise<[Entity]> {
        fetchCallCount += 1
        return fetchPromise
    }
}
