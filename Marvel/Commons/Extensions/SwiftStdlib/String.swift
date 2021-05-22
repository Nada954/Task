//
//  String.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation

extension String {
    var isBlank: Bool {
        let trimmed = trimmingCharacters(in: .whitespaces)
        return trimmed.isEmpty
    }

    var nilIfEmpty: String? {
        isBlank ? nil : self
    }
}
