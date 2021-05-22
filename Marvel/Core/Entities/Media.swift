//
//  Media.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation

struct Media: IdentifiableEntity {
    let id: ID
    let title: String?
    let thumbnail: Image?

    init(
        id: ID,
        title: String?,
        thumbnail: Image?
    ) {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
    }
}
