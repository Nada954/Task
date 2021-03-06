//
//  CharacterViewItemTests.swift
//  MarvelTests
//
//  Created by MACBOOK on 21/05/2021.
//

@testable import Marvel
import XCTest

final class CharacterViewItemTests: XCTestCase {
    func testItemWhenFieldsAreNotNil() {
        let model = MarvelCharacter.item(index: 0)
        let item = CharacterViewItem(model)

        XCTAssertEqual(item.model, model)
        XCTAssertEqual(item.imageURL, model.thumbnail?.url)
        XCTAssertEqual(item.nameTitle, L10n.Character.name)
        XCTAssertEqual(item.name, model.name)
        XCTAssertEqual(item.descriptionTitle, L10n.Character.description)
        XCTAssertEqual(item.description, model.description)
    }

    func testItemWhenFeildsAreNil() {
        let model = MarvelCharacter(
            id: .init(rawValue: 0),
            name: nil,
            description: nil,
            thumbnail: nil
        )
        let item = CharacterViewItem(model)

        XCTAssertEqual(item.model, model)
        XCTAssertEqual(item.nameTitle, L10n.Character.name)
        XCTAssertEqual(item.name, L10n.Common.notAvailable)
        XCTAssertEqual(item.descriptionTitle, L10n.Character.description)
        XCTAssertEqual(item.description, L10n.Common.notAvailable)
        XCTAssertNil(item.imageURL)
    }
}
