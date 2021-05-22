//
//  Entity.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation

protocol Entity: Codable, Equatable {}
protocol IdentifiableEntity: Entity, Identifiable where RawIdentifier == Int {}

extension Entity {
    static var key: String { String(describing: self) }
}
