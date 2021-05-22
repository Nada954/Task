//
//  MarvelResponse.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation

struct MarvelResponse<Value: Entity>: Entity {
    let status: String?
    let message: String?
    let data: Paginator<Value>?

    init(
        status: String? = nil,
        message: String? = nil,
        data: Paginator<Value>? = nil
    ) {
        self.status = status
        self.message = message
        self.data = data
    }
}
