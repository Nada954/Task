//
//  MediaGatewayStub.swift
//  MarvelTests
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation
@testable import Marvel

final class MediaGatewayStub: MediaGateway {
    var parameter: MarvelParameter<MediaParameter>!
    var promise: Promise<MediaPaginator>!
    var callCount = 0

    func loadMediaItems(
        with parameter: MarvelParameter<MediaParameter>
    ) -> Promise<MediaPaginator> {
        self.parameter = parameter
        callCount += 1
        return promise
    }
}
