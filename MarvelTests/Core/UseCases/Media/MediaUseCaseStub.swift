//
//  MediaUseCaseStub.swift
//  MarvelTests
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation
@testable import Marvel

final class MediaUseCaseStub: MediaUseCase {
    var parameter: MediaParameter!
    var promise: Promise<MediaPaginator>!
    var callCount = 0

    func loadMediaItems(with parameter: MediaParameter) -> Promise<MediaPaginator> {
        self.parameter = parameter
        callCount += 1
        return promise
    }
}
