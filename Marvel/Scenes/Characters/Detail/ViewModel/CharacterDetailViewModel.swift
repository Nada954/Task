//
//  CharacterDetailViewModel.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation

final class CharacterDetailViewModel {
    // MARK: - Typealias

    typealias CharacterDetailState = State<CharacterDetailsViewItem>

    // MARK: - Properties

    private let mediaUseCase: MediaUseCase
    private(set) var character: Dynamic<CharacterViewItem>
    private(set) lazy var state = Dynamic<CharacterDetailState>(.populated([comicsItem, seriesItem,storiesItem]))
    private(set) lazy var comicsItem = CharacterDetailsViewItem(type: .comics)
    private(set) lazy var seriesItem = CharacterDetailsViewItem(type: .series)
    private(set) lazy var storiesItem = CharacterDetailsViewItem(type: .stories)
    private(set) lazy var eventsItem = CharacterDetailsViewItem(type: .events)
    // MARK: - Init / Deinit

    init(
        mediaUseCase: MediaUseCase,
        character: CharacterViewItem
    ) {
        self.mediaUseCase = mediaUseCase
        self.character = Dynamic(character)
    }
}

// MARK: - UseCase

extension CharacterDetailViewModel {
    func loadItems() {
        MediaType.allCases.forEach(loadItem)
    }

    private func loadItem(of type: MediaType) {
        let parameter = MediaParameter(id: character.value.model.id, type: type)
        mediaUseCase.loadMediaItems(with: parameter).then {
            let viewItems = $0.results.map(CharacterDetailsViewItem.MediaItem.init)
            self.updateItem(type: type, with: .populated(viewItems))
        }.catch {
            self.state.value = .error($0)
        }
    }

    private func updateItem(type: MediaType, with state: State<CharacterDetailsViewItem.MediaItem>) {
        switch type {
        case .comics:
            comicsItem.state = state
        case .series:
            seriesItem.state = state
        case .stories:
            storiesItem.state = state
        case .events:
            eventsItem.state = state
        }
        self.state.value = .populated([comicsItem, seriesItem,storiesItem,eventsItem])
    }
}
