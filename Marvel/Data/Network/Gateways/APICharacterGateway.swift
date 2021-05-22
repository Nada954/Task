//
//  APICharacterGateway.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import CoreNetwork

final class APICharacterGateway: CharacterGateway {
    private let apiClient: APIClient

    init(apiClient: APIClient = DefaultAPIClient()) {
        self.apiClient = apiClient
    }
}

extension APICharacterGateway {
    func loadCharacters(with parameter: MarvelParameter<CharacterParameter>) -> Promise<CharacterPaginator> {
        let request = RequestBuilder<MarvelCharacter>()
            .path("characters")
            .method(.get)
            .urlParameters(parameter)
            .build()
        return apiClient.execute(request)
    }
}
