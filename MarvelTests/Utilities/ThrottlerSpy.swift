//
//  ThrottlerSpy.swift
//  MarvelTests
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation
@testable import Marvel

final class ThrottlerSpy: Throttler {
    var completion: (() -> Void)!
    var callCount = 0

    func throttle(_ block: @escaping () -> Void) {
        callCount += 1
        completion = block
    }
}
