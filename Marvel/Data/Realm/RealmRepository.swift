//
//  RealmRepository.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation
import RealmSwift

final class RealmRepository<E: IdentifiableEntity>: AbstractRepository {
    func fetchAll() -> Promise<[E]> {
        Promise<[E]> { fullfill, reject in
            do {
                let realm = try Realm()
                let objects = realm.objects(RealmObject.self).filter("key == %@", E.key)
                let entities: [E] = try objects.map { try $0.data.decoded() }
                fullfill(entities)
            } catch {
                reject(error)
            }
        }
    }

    @discardableResult
    func save(entites: [E]) -> Promise<Void> {
        Promise<Void> { fullfill, reject in
            do {
                let realm = try Realm()
                try realm.write {
                    let objects = try entites.map { RealmObject(id: "\($0.id)", key: E.key, data: try $0.encoded()) }
                    realm.add(objects, update: .all)
                }
                fullfill(())
            } catch {
                reject(error)
            }
        }
    }
}
