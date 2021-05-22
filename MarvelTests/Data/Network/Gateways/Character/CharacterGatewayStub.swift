//
//  CharacterGatewayStub.swift
//  MarvelTests
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation
@testable import Marvel

final class CharacterGatewayStub: CharacterGateway {
    var parameter: MarvelParameter<CharacterParameter>!
    var promise: Promise<CharacterPaginator>!
    var callCount = 0

    func loadCharacters(
        with parameter: MarvelParameter<CharacterParameter>
    ) -> Promise<CharacterPaginator> {
        self.parameter = parameter
        callCount += 1
        return promise
    }
}
