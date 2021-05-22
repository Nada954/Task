//
//  Dynamic.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation

final class Dynamic<Value> {
    typealias Listener = (Value) -> Void

    private var listener: Listener?

    var value: Value {
        didSet { listener?(value) }
    }

    init(_ value: Value) {
        self.value = value
    }

    func bind(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
