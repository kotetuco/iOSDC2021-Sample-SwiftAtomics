//
//  ViewController.swift
//  SwiftAtomicsSample
//
//  Created by kotetu on 2021/07/28.
//

import UIKit

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let iterations = 10
        executeCounter(iterations: iterations)
        executeAtomicCounter(iterations: iterations, isOrderingRelaxed: true)
    }

    private func executeCounter(iterations: Int) {
        let start = Date()
        let counter = Counter()
        DispatchQueue.concurrentPerform(iterations: iterations) { index in
            let count = counter.increment()
            print("index\(index): count is \(count).")
        }
        let elapsed = Date().timeIntervalSince(start)
        print("elapsed: \(elapsed)")
        print("Count is \(counter.count).")
    }

    private func executeAtomicCounter(iterations: Int, isOrderingRelaxed: Bool) {
        let start = Date()
        let counter = AtomicCounter(isOrderingRelaxed: isOrderingRelaxed)
        DispatchQueue.concurrentPerform(iterations: iterations) { index in
            let count = counter.increment()
            print("(atomic)index\(index): count is \(count).")
        }
        let elapsed = Date().timeIntervalSince(start)
        print("elapsed(atomic): \(elapsed)")
        print("(atomic)Count is \(counter.count).")
    }
}
