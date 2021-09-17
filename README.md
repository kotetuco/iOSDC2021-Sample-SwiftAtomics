# iOSDC2021-Sample-SwiftAtomics
iOSDC2021冊子内記事 `Swift Atomicsで快適なアトミック操作を` のサンプルコードです。

# サンプルコードの内容

iOSアプリとして実行可能なサンプルとPlaygroundが含まれています。

## iOSアプリとして実行可能なサンプル

- Swift Atomicsを使ったカウンターの実装サンプルです。
  - Swift Atomicsを使ったカウンター(AtomicCounter)と、排他制御等を一切施していないカウンター(Counter)の2種類の実装サンプルが [Counter.swift](https://github.com/kotetuco/iOSDC2021-Sample-SwiftAtomics/blob/main/SwiftAtomicsSample/SwiftAtomicsSample/Counter.swift) にあります。
  - AtomicCounterとCounterで並列実行のカウント処理を行っており、処理結果を比較できるような作りになっています。
  - [ViewController.swift](https://github.com/kotetuco/iOSDC2021-Sample-SwiftAtomics/blob/main/SwiftAtomicsSample/SwiftAtomicsSample/ViewController.swift)内の `iterations` という定数の数値を変えることで、様々なケースで実行結果を比較することができます。

## Playground　 (SwiftAtomicsSample.playground)

- 原稿内で使用したコードがまとめられています。単純に原稿内のサンプルコードを動かしたい場合はこちらをお使いください。

# 動作環境

- 開発環境: Xcode 12.5.1
- Deployment Target: 12.3
- サンプルで利用するSwift AtomicsはSwift PMで管理しています。
  - 原稿作成時点のバージョンは `0.0.3` です。
