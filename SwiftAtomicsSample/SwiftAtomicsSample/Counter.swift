//
//  Counter.swift
//  SwiftAtomicsSample
//
//  Created by kotetu on 2021/07/28.
//

import Atomics
import Foundation

protocol Countable {
    var count: Int { get }
    func increment() -> Int
}

final class Counter: Countable {
    private var counter: Int = 0

    var count: Int {
        counter
    }

    func increment() -> Int {
        counter += 1
        return counter
    }
}

final class AtomicCounter: Countable {
    private let counter = ManagedAtomic<Int>(0)
    private let isOrderingRelaxed: Bool

    public init(isOrderingRelaxed: Bool = true) {
        self.isOrderingRelaxed = isOrderingRelaxed
    }

    var count: Int {
        isOrderingRelaxed ?
            counter.load(ordering: .relaxed) :
            counter.load(ordering: .sequentiallyConsistent)
    }

    func increment() -> Int {
        isOrderingRelaxed ?
            counter.wrappingIncrementThenLoad(ordering: .relaxed) :
            counter.wrappingIncrementThenLoad(ordering: .acquiringAndReleasing)
    }
}
