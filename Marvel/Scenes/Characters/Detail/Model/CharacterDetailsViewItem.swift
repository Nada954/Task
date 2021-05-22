//
//  CharacterDetailsViewItem.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation

struct CharacterDetailsViewItem: Equatable {
    private let type: MediaType
    var state: State<MediaItem>
    var title: String {
        switch type {
        case .comics:
            return L10n.Character.comics
        case .series:
            return L10n.Character.series
        case .stories:
            return L10n.Character.stories
        case .events:
            return L10n.Character.events
        }
    }

    init(
        type: MediaType,
        state: State<MediaItem> = .loading
    ) {
        self.type = type
        self.state = state
    }
}

extension CharacterDetailsViewItem {
    struct MediaItem: Equatable {
        private(set) var model: Media

        var title: String { model.title.defaultIfEmpty }
        var imageURL: URL? { model.thumbnail?.url }

        init(model: Media) {
            self.model = model
        }
    }
}
