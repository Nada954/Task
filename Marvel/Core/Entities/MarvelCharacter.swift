//
//  MarvelCharacter.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation

struct MarvelCharacter: IdentifiableEntity {
    let id: ID
    let name: String?
    let description: String?
    let thumbnail: Image?
}
