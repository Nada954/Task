//
//  APIMarvelMediaGateway.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import CoreNetwork

final class APIMarvelMediaGateway: MediaGateway {
    private let apiClient: APIClient

    init(apiClient: APIClient = DefaultAPIClient()) {
        self.apiClient = apiClient
    }
}

extension APIMarvelMediaGateway {
    func loadMediaItems(with parameter: MarvelParameter<MediaParameter>) -> Promise<MediaPaginator> {
        let request = RequestBuilder<Media>()
            .path("characters/\(parameter.value.id)/\(parameter.value.type.rawValue)")
            .method(.get)
            .urlParameters(parameter)
            .build()
        return apiClient.execute(request)
    }
}
