//
//  CharacterDetailsViewItemTests.swift
//  MarvelTests
//
//  Created by MACBOOK on 21/05/2021.
//

@testable import Marvel
import XCTest

final class CharacterDetailsViewItemTests: XCTestCase {
    func testComicItem() {
        var item = CharacterDetailsViewItem(type: .comics)
        item.state = .idle

        XCTAssertEqual(item.title, L10n.Character.comics)
        XCTAssertEqual(item.state, .idle)

        item.state = .loading
        XCTAssertEqual(item.state, .loading)
    }

    func testSeriesItem() {
        var item = CharacterDetailsViewItem(type: .series)
        item.state = .idle

        XCTAssertEqual(item.title, L10n.Character.series)
        XCTAssertEqual(item.state, .idle)

        item.state = .loading
        XCTAssertEqual(item.state, .loading)
    }

    func testStoriesItem() {
        var item = CharacterDetailsViewItem(type: .stories)
        item.state = .idle

        XCTAssertEqual(item.title, L10n.Character.stories)
        XCTAssertEqual(item.state, .idle)

        item.state = .loading
        XCTAssertEqual(item.state, .loading)
    }
    
    func testEventsItem() {
        var item = CharacterDetailsViewItem(type: .events)
        item.state = .idle

        XCTAssertEqual(item.title, L10n.Character.events)
        XCTAssertEqual(item.state, .idle)

        item.state = .loading
        XCTAssertEqual(item.state, .loading)
    }
    
    func testMediaItemWhenFeildsAreNotNil() {
        let model = Media.item(index: 0)
        let item = CharacterDetailsViewItem.MediaItem(model: model)

        XCTAssertEqual(item.model, model)
        XCTAssertEqual(item.title, model.title)
        XCTAssertEqual(item.imageURL, model.thumbnail?.url)
    }

    func testMediaItemWhenFeildsAreNil() {
        let model = Media(id: .init(rawValue: 0), title: nil, thumbnail: nil)
        let item = CharacterDetailsViewItem.MediaItem(model: model)

        XCTAssertEqual(item.model, model)
        XCTAssertEqual(item.title, L10n.Common.notAvailable)
        XCTAssertNil(item.imageURL)
    }
}
