//
//  CellConfigurable.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import UIKit

protocol CellConfigurable {
    associatedtype Item: Equatable

    func configure(with item: Item)
}
