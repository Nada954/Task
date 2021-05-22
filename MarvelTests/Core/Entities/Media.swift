//
//  Media.swift
//  MarvelTests
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation
@testable import Marvel

extension Media {
    static func items(numberOfElements: Int = 2) -> [Self] {
        var items = [Self]()
        for index in 0..<numberOfElements {
            let item = item(index: index)
            items.append(item)
        }
        return items
    }

    static func item(index: Int) -> Self {
        .init(
            id: .init(rawValue: index),
            title: "title:\(index)",
            thumbnail: .init(
                path: "path\(index)",
                extension: "extension\(index)"
            )
        )
    }
}
