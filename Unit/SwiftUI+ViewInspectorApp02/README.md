# SwiftUI+ViewInspectorApp02

## SwiftUIでViewInspectorを使いテストコード書いてみた！
## 目的
UnitTestを行うライブラリであるViewInspectorを使い、SwiftUIでテストコード書くこと。


## ViewInspector とは

https://github.com/nalexn/ViewInspector

UnitTest用サードパティ製のフレームワーク(ライブラリ)。SwiftUIにはUnitTestのためのフレームワークが標準では(今のところ)用意されていません。そのため、ViewInspectorを使いUnitTestを作成します。


## これから何をするのか？
`ViewのTextの文字列についてのテスト` や `ボタンを押した時場合の挙動` のテストを実装します。

👇 アプリ実行画面
<img width = 30% src = "https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/764557/9ba079c0-3c51-2273-6745-0083dafb0b6b.png">

👇 テスト実行結果
<img width = 80% src = "https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/764557/8f719a30-70ec-bac5-3453-38be25620608.png">


## 手順
⓪:任意のSwiftUIプロジェクトを作成
①:SPMを用いてライブラリ(ViewInspector)をインストール
②:Viewを実装 → コピペでOK
③:テストコード実装
④:ViewModel追加/View変更 → コピペでOK

### ⓪:任意のSwiftUIプロジェクトを作成
今回 `SwiftUI+ViewInspectorApp02`という名前でプロジェクトを作成しました。

<img width = 50% src = "https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/764557/0993f689-0d6e-93ec-448b-af40aa151174.png">


### ①:SPMを用いてライブラリ(ViewInspector)をインストール
今回、私は`Swift Package Manager(SPM)`でインストールします。

- Xcodeプロジェクト設定>PROJECT>Swift Packages>"+"ボタンを押します
- URL入力欄に `https://github.com/nalexn/ViewInspector` を入力します
- `Up to Next Major`を選択しNextを押します
- Add to Targetとして`〜Tests`のターゲットを選択します

<img width = 40% src = "https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/764557/23bbc037-306c-c48a-0e98-dc541a77fe9d.png">

<img width = 80% src = "https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/764557/25f3d9f8-94f7-e6bc-de29-6cf32323f99d.png">



### ②:Viewを実装 → コピペでOK

<details>
<summary>ContentView.swift</summary>

```ContentView.swift
import SwiftUI

struct ContentView: View {
    @State var count = 0
    
    var body: some View {
        VStack {
            Text("Hellow World!")
                .padding()
            Text("\(count)")
                .padding()
            Button( action: {
                self.count += 1
            }) {
                Text("CountAddButton")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
</details>

<details>
<summary>実行画面</summary>
<img width = 40% src = "https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/764557/83b17a74-6d06-eb84-b4ee-9cb7b7859642.png">
</details>

### ③:テストコード実装 → コピペでOK
```SwiftUI_ViewInspectorApp02Tests.swift
import XCTest
import ViewInspector   // 追加①

@testable import SwiftUI_ViewInspectorApp02

extension ContentView: Inspectable { }   // 追加②

final class SwiftUI_ViewInspectorApp02Tests: XCTestCase {
    
    // ==追加③==
    func test_画面に表示されている文字() throws {
        try XCTContext.runActivity(named: "static string") { _ in
            let view = ContentView()
            let text = try view.inspect().vStack().text(0).string()   // VStackの0番目に配置されている要素
            XCTAssertEqual(text, "Hellow World!")
        }
        
        try XCTContext.runActivity(named: "dynamic string") { _ in
            let view = ContentView()
            var count = try view.inspect().vStack().text(1).string()   // カウントの初期値
            XCTAssertEqual(count, "0")
            
            try view.inspect().vStack().button(2).tap()
            count = try view.inspect().vStack().text(1).string()
            XCTAssertEqual(count, "1")   // エラー
        }
    }
    // ========
    
    // ↓ 元々あったプログラム
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
```

#### 説明
```.swift
// １つのテストケース内でいろいろなことをやってしまった結果、
// なんのテストをしているのかがわかりづらくなることがある。
// そこで、このXCTActivityを使ってわかりやすくする
try XCTContext.runActivity(named: "static string") { _ in
}
```

```.swift
// Unitテストを行うViewをインストタンス化
let view = ContentView()

// VStack内の子要素の文字列を取得
//                                          ↓ Text()がVStack()の何番目の要素か明記する
let text = try view.inspect().vStack().text(0).string() 

// 取得した文字列 が "Hellow World!" と一致するかテスト
XCTAssertEqual(text, "Hellow World!")
```

```.swift
// ボタンをタップ
try view.inspect().vStack().button(2).tap()

// ボタンをタップした後の count の値をテスト
XCTAssertEqual(count, "1")   // ! このままだとエラーが発生します

== エラー内容
test_画面に表示されている文字(): XCTAssertEqual failed: ("0") is not equal to ("1")
```

👉 ViewModelを追加し、Viewに表示するデータ(count)をViewModelで管理しましょう


### ④:ViewModel追加

<details>
<summary>SwiftUI_ViewInspectorApp02App.swift</summary>

```SwiftUI_ViewInspectorApp02App.swift
import SwiftUI

@main
struct SwiftUI_ViewInspectorApp02App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init(count: 0))
            
        }
    }
}
```
</details>


<details>
<summary>ContentViewModel.swift</summary>

```ContentViewModel.swift
import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var count: Int
    
    init(count: Int) {
        self.count = count
    }
    
    func increment() {
        self.count += 1
    }
}
```
</details>


<details>
<summary>ContentView.swift</summary>

```ContentView.swift
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack {
            Text("Hellow World!")
                .padding()
            Text("\(self.viewModel.count)")
                .padding()
            Button( action: {
                viewModel.increment()
            }) {
                Text("CountAddButton")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init(count: 0))
    }
}
```
</details>

<br>

###  以上です！ 気になることやアドバイスは、ぜひコメントお願いします！


## 参考文献

https://zenn.dev/usk2000/articles/9e3861e76894b7

https://github.com/nalexn/ViewInspector




