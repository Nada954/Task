//
//  CharactersCoordinatorDelegateSpy.swift
//  MarvelTests
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation
@testable import Marvel

final class CharactersCoordinatorDelegateSpy: CharactersCoordinatorDelegate {
    var didTapSearchCallCount = 0
    var didTapCancelSearchCallCount = 0
    var didSelectCharacterCallCount = 0
    var character: CharacterViewItem!

    func didTapSearch() {
        didTapSearchCallCount += 1
    }

    func didTapCancelSearch() {
        didTapCancelSearchCallCount += 1
    }

    func didSelect(character: CharacterViewItem) {
        didSelectCharacterCallCount += 1
        self.character = character
    }
}
