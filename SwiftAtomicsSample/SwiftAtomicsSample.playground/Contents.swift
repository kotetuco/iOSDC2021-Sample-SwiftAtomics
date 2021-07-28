// 原稿内のサンプルプログラムと異なり、本サンプルでは排他制御を行わない場合のインクリメント処理を追加で入れています。
// ※ Xcodeの問題でSwift Atomicsのメソッドにハイライトが当たらないことがありますが、実行は問題なくできるはずです。

import Atomics
import Foundation

let iterations = 10

//
// 排他制御がない状態のカウント処理
//

var counter: Int = 0

DispatchQueue.concurrentPerform(iterations: iterations) { _ in
    counter += 1
}

// Count is 10. とはならないことがある
print("Count is \(counter).")

//
// Swift Atomicsを使ったカウント処理
//

let atomicCounter = ManagedAtomic<Int>(0)

DispatchQueue.concurrentPerform(iterations: iterations) { _ in
    let count = atomicCounter.wrappingIncrementThenLoad(ordering: .relaxed)
}

// (atomic)Count is 10.
print("(atomic)Count is \(atomicCounter.load(ordering: .relaxed)).")
