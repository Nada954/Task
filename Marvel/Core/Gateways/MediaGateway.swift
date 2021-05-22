//
//  MediaGateway.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation

protocol MediaGateway {
    func loadMediaItems(with parameter: MarvelParameter<MediaParameter>) -> Promise<MediaPaginator>
}
