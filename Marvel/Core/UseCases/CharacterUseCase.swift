//
//  CharacterUseCase.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation

// MARK: - Paginator

typealias CharacterPaginator = Paginator<MarvelCharacter>

// MARK: - Parameters

struct CharacterParameter: Parameter {
    private let nameStartsWith: String?
    private let limit: Int?
    private let offset: Int?

    init(
        query: String? = nil,
        limit: Int? = nil,
        offset: Int? = nil
    ) {
        self.nameStartsWith = query
        self.limit = limit
        self.offset = offset
    }
}

// MARK: - UseCase

protocol CharacterUseCase {
    func loadCharacters(with parameter: CharacterParameter) -> Promise<CharacterPaginator>
}

final class DefaultCharacterUseCase {
    private let gateway: CharacterGateway
    private let repository: AnyRepository<MarvelCharacter>

    init(gateway: CharacterGateway, repository: AnyRepository<MarvelCharacter>) {
        self.gateway = gateway
        self.repository = repository
    }
}

extension DefaultCharacterUseCase: CharacterUseCase {
    func loadCharacters(with parameter: CharacterParameter) -> Promise<CharacterPaginator> {
        gateway
            .loadCharacters(with: .init(parameter))
            .then { self.repository.save(entites: $0.results) }
            .recover { _ in self.repository.fetchAll().then { CharacterPaginator(results: $0) } }
    }
}
