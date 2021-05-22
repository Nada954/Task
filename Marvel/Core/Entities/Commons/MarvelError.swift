//
//  MarvelError.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation

struct MarvelError: Equatable {
    private(set) var message: String

    init(_ message: String) {
        self.message = message
    }
}

// MARK: - LocalizedError

extension MarvelError: LocalizedError {
    var localizedDescription: String {
        message
    }
}

// MARK: - Constants

extension MarvelError {
    static let general = MarvelError(L10n.Error.general)
    static let decode = MarvelError(L10n.Error.decode)
}
