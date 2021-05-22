//
//  CharacterGateway.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation

protocol CharacterGateway {
    func loadCharacters(with parameter: MarvelParameter<CharacterParameter>) -> Promise<CharacterPaginator>
}
