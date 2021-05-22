//
//  RealmObject.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation
import RealmSwift

final class RealmObject: Object {
    @objc dynamic var id = ""
    @objc dynamic var key = ""
    @objc dynamic var data = Data()

    convenience init(id: String, key: String, data: Data) {
        self.init()
        self.id = id
        self.key = key
        self.data = data
    }

    override static func primaryKey() -> String? {
        "id"
    }
}
