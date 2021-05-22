//
//  Optional.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation

extension Optional where Wrapped == String {
    var defaultIfEmpty: String {
        switch self {
        case let .some(value):
            return value.nilIfEmpty ?? L10n.Common.notAvailable
        case .none:
            return L10n.Common.notAvailable
        }
    }
}
