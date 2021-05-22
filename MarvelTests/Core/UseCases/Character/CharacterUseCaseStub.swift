//
//  CharacterUseCaseStub.swift
//  MarvelTests
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation
@testable import Marvel

final class CharacterUseCaseStub: CharacterUseCase {
    var parameter: CharacterParameter!
    var promise: Promise<CharacterPaginator>!
    var callCount = 0

    func loadCharacters(with parameter: CharacterParameter) -> Promise<CharacterPaginator> {
        self.parameter = parameter
        callCount += 1
        return promise
    }
}
