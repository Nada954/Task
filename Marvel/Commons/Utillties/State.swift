//
//  State.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation

enum State<Value: Equatable> {
    case idle
    case loading
    case paging([Value], next: Int)
    case populated([Value])
    case empty
    case error(Error)

    var nextPage: Int {
        guard case let .paging(_, nextPage) = self else {
            return 0
        }
        return nextPage
    }

    var items: [Value] {
        switch self {
        case let .paging(items, _):
            return items
        case let .populated(items):
            return items
        default:
            return []
        }
    }
}

extension State: Equatable {
    static func == (lhs: State<Value>, rhs: State<Value>) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle):
            return true
        case (.loading, .loading):
            return true
        case (.empty, .empty):
            return true
        case let (.error(lhsError), .error(rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        case let (.populated(lhsValue), .populated(rhsValue)):
            return lhsValue == rhsValue
        case let (.paging(lhsValue, lhsNextPage), .paging(rhsValue, next: rhsNextPage)):
            return lhsValue == rhsValue && lhsNextPage == rhsNextPage
        default:
            return false
        }
    }
}
