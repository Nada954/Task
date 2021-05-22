//
//  Throttler.swift
//  Marvel
//
//  Created by MACBOOK on 21/05/2021.
//

import Foundation

protocol Throttler {
    func throttle(_ block: @escaping () -> Void)
}

final class DefaultThrottler {
    private var workItem = DispatchWorkItem {}
    private var previousRun = Date.distantPast
    private let queue: DispatchQueue
    private let minimumDelay: TimeInterval

    init(minimumDelay: TimeInterval, queue: DispatchQueue = DispatchQueue.main) {
        self.minimumDelay = minimumDelay
        self.queue = queue
    }
}

extension DefaultThrottler: Throttler {
    func throttle(_ block: @escaping () -> Void) {
        workItem.cancel()

        workItem = DispatchWorkItem { [weak self] in
            self?.previousRun = Date()
            block()
        }
        let delay = previousRun.timeIntervalSinceNow > minimumDelay ? 0 : minimumDelay
        queue.asyncAfter(deadline: .now() + Double(delay), execute: workItem)
    }
}
