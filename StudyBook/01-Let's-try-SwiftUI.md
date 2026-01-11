SwiftUI を使ってみよう
今回は、SwiftUI を用いて iOS アプリを作成していきます。

今回の環境は、

macOS Big Sur 11.4
Xcode 12.5.1 (12E507)
です。

目次
【講義】SwiftUI とは
【実習】SwiftUI の Project を作成しよう
LandmarksApp.swift
ContentView.swift
プレビューを表示してみよう
文字をカスタマイズしてみよう
スタックビューを使ってみよう
円形の画像を作ろう
マップビューを作ろう
詳細ビューを作ろう
まとめ
【講義】SwiftUI とは
SwiftUI とは、 Apple プラットフォームのアプリケーション開発にて用いられる、新しい UI フレームワークのことです。従来のUIKitに比べてより少ないコードで開発できるメリットがあります。

Storyboard では、UI を GUI で定義し、Swift で書かれた UIViewController のサブクラスと紐付けることでビューの操作を行いました。SwiftUI では、このような GUI 操作が不要となっており、Swift のみでビューを定義できます。Storyboard でのアプリ作成では、GUI 操作が大変だった人もいるかもしれません。SwiftUI では、すべてプログラムを書くことで UI を構築していくので、このような大変さがなくなります。また、プレビュー機能が備わっており、書いたコードがすぐにプレビューに反映されます。

この章では、ランドマークを記録する Landmarks というアプリを開発していきます。
早速 Project を作成して iOS アプリを作成していきましょう。

【実習】SwiftUI の Project を作成しよう
Xcode を起動し、Create a new Xcode をクリックして 新しい Project を作成しましょう。 下の図の画面が表示されない場合は、メニューバーの File ＞ New > Project で作成します。

新しい Project を作成
テンプレートを選ぶ画面では、 iOS タブの App を選択し、 Next を押します。

App のテンプレートを選択
Product Name を Landmarks 、 Interface は SwiftUI を選び Next を押します。

Option を設定し、Nextをクリック
保存先を尋ねられるので、~/workspace/ 以下に保存しておきましょう。

下記のコードが自動で生成されます。

import SwiftUI

@main
struct LandmarksApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

Please Type!
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

Please Type!
Xcode 14 以降Xcode 13 以前
LandmarksApp.swift
LandmarksApp.swift ファイルはアプリのエントリポイントです。
SwiftUI の機能を使用するため、最初に SwiftUI フレームワークをインポートしています。

import SwiftUI

App プロトコルに準拠した構造体を宣言してアプリを作成します。
@main 属性を使用して、この構造体がアプリのエントリポイントを含むことを示しています。

@main
struct LandmarksApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

この構造体はアプリのシーンを定義する body プロパティを実装します。
このプロパティは Scene プロトコルに準拠する型のインスタンスを返す計算プロパティです。

WindowGroup 構造体はアプリの主要なウィンドウを管理するためのコンテナです。
アプリのエントリポイントとして機能して、アプリが開始されるときに最初に表示されるビューを定義します。

ContentView() は ContentView.swift ファイルで定義されている ContentView 構造体のインスタンスを作成しています。
後述しますが、この構造体はアプリのメインビューになります。

不透明な結果型 (Opaque Result Types)
some キーワードは不透明な結果型を定義するために使用します。
不透明な結果型は特定のプロトコルに準拠する任意の型を返すことを示します。
これは具体的な型を指定せず、その型が準拠すべきプロトコルのみを指定する方法です。
具体的な型はコンパイラが推論します。

今回の場合は Scene プロトコルに準拠する WindowGroup や DocumentGroup などの型を返すことを示しています。
これにより、型の詳細を隠蔽しつつ、パフォーマンスを損なうことなく、型がプロトコルに準拠していることを保証できます。

ContentView.swift
ContentView.swift ファイルはアプリのメインビューです。
ContentView 構造体は View プロトコルに準拠しています。

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

View は SwiftUI のビューを表すプロトコルです。
カスタムビューを作成するときは View プロトコルに準拠した型を宣言する必要があります。

この構造体はビューのコンテンツを定義する body プロパティを実装します。
このプロパティは View プロトコルに準拠する型のインスタンスを返す計算プロパティです。

VStack 構造体はサブビューを垂直に並べるスタックビューです。
これは SwiftUI が提供する組み込みのビューです。

Image 構造体や Text 構造体も同様です。
これらのビューは全て View プロトコルに準拠しています。

このように、さまざまなビューを組み合わせて UI を構築していきます。

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

このコードは ContentView のプレビューを表示するために使用されます。
このプレビューを利用して、実際のデバイスやシミュレータでアプリを実行する前に UI を確認できます。

ContentView_Previews 構造体は PreviewProvider プロトコルに準拠しています。

この構造体はプレビューするビューのコレクションを定義する previews プロパティを実装します。
このプロパティは View プロトコルに準拠する型のインスタンスを返す型計算プロパティです。

なお Xcode 15 以降は Preview(_:body:) のようなプレビューマクロも使用できます。

プレビューを表示してみよう
早速プレビューを表示してみましょう。
ContentView.swift を開くとエディタの右側にキャンバスの画面が表示されています。

Xcode 13 以前の場合は Resume というボタンを押すことでキャンバス上にプレビューが表示されます。
SwiftUI ではキャンバス上にリアルタイムのプレビューを表示することができます。

ただし、初回の起動には時間がかかります。

Resume をクリック
プレビューで Hello, world! と表示されます。
Xcode 14 以降は 🌐 も表示されていると思います。

プレビュー上にHello Worldの表示
キャンバスが表示されない時は
Xcode にキャンバスが表示されない時は、上のメニューバー上のEditor ＞ Canvas にチェックを入れることで表示することができます。

キャンバスを表示
文字をカスタマイズしてみよう
プレビューの画面の Hello,World! を command⌘ + クリックします。
Xcode のバージョンによっては command + control + クリックになります。

下の図のようなメニューが表示されるので、Show SwiftUI Inspector...を選択します。

Show SwiftUI Inspector...を選択
メニューが表示されない場合はキャンバスが編集可能になっているか確認してください。

キャンバスを選択可能状態にする
インスペクタが表示されたら、Textを東京タワー、Modifers の Font を Title に変更しましょう。 ここで、padding の右側のチェックも外しておきましょう。

インスペクタで操作
プレビューの文字の表示が変わりましたね。
エディタをみると自動でコードが書き加えられていることがわかります。
次はエディタのコードを手作業で変えてみましょう。

                .foregroundStyle(.tint)
            Text("東京タワー")
                .font(.title)
                .foregroundStyle(.green)
        }
        .padding()
    }
Please Type!
Xcode 14 以降Xcode 13 以前
文字が緑になる
文字が緑になりますね。
このように、SwiftUIではインスペクタを用いてマウス操作での開発もコードを書いて編集することもできます。 Text のコードをcommand⌘ + クリックすることでもインスペクタを開くことができます。 Xcode のバージョンによっては control + クリックになります。

インスペクタを開くことができる
インスペクタで Color を Inherited に戻しておきましょう。
プレビューは黒に戻り、エディタから .foregroundStyle(.green) は消えましたね。

スタックビューを使ってみよう
前のセクションで作成したタイトルビューに加えて、所在地などの情報を含むテキストビューを追加していきましょう。 SwiftUI では複数のビューを組み合わせてスタック埋め込むことができます。

VStack は垂直に並べるスタックビューです。

Xcode 14 以降は VStack が既に追加されています。
今のところ必要ないコードも含まれているので、削除しましょう。

struct ContentView: View {
    var body: some View {
        VStack {
            Text("東京タワー")
                .font(.title)
        }
    }
}


Xcode 14 以降Xcode 13 以前
+ ボタン もしくは command⌘ + ⇧shift + L で Library を開きます。
Text をドラッグ&ドロップで東京タワーの下に入れましょう。

Text を追加
        VStack {
            Text("東京タワー")
                .font(.title)
            Text("Placeholder")
        }
    }
}
Please Type!
このように表示されていますね。 Placeholder のところに東京都港区と入力しておきましょう。 フォントは subheadline にしておきましょう。 スタックが左寄せになるようにインスペクタで alignment を左寄せにしておきましょう。 alignment は英語で照準や整列などの意味があります。 左寄せのボタンを押すと下記のコードになりますね。.leading が左寄せを意味していることがわかると思います。


struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("東京タワー")
                .font(.title)
            Text("東京都港区")
                .font(.subheadline)
        }
    }
}
Please Type!Please Type!
次に所在地の横に都道府県を入れていきましょう。 横並びにするときは HStack を使用します。 東京都港区の Text をcommand⌘ + クリックして Embed in HStack を選択しましょう。 東京都港区の Text の下に東京都のTextを追加しましょう。 コードを書いても Libraly から追加しても構いません。 フォントは東京都港区と同じで subheadline にしておきましょう。

        VStack(alignment: .leading) {
            Text("東京タワー")
                .font(.title)
            HStack {
                Text("東京都港区")
                    .font(.subheadline)
                Text("東京都")
                    .font(.subheadline)
            }
        }
    }
}
Please Type!
このままでは所在地と都道府県名が近すぎるので、間に Spacer() を入れておきます。

            HStack {
                Text("東京都港区")
                    .font(.subheadline)
                Spacer()
                Text("東京都")
                    .font(.subheadline)
            }
Please Type!
端により過ぎているので VStack に paddingを加えましょう。
VStack のインスペクタで Paddingの 4 辺にチェックを入れるか、Editor で padding() を加えます。

                    .font(.subheadline)
            }
        }
        .padding()
    }
}

Please Type!
Padding を追加
Padding を追加することで、より見やすくなりましたね。

円形の画像を作ろう
このセクションでは四角の画像を円形にするカスタムビューを作ります。 コードを加えることで写真にマスクをかけたり、枠や影をつけることができます。

こちらからダウンロードしたデータの中の東京タワー@2x.jpg というファイルを Assets.xcassets の中にドラック&ドロップで入れましょう。

Assets.xcassets に写真を追加
カスタムイメージビューを作るために、新しいSwiftUI View を作成します。
File ＞ New ＞ File から新しいファイルを作成します。テンプレートは iOS の SwiftUI View 、ファイル名は CircleImageView.swift にします。

SwiftUI View を選択
テキストを先程準備した東京タワーの画像に差し替えましょう。


struct CircleImageView: View {
    var body: some View {
        Image("東京タワー")
    }
}

Please Type!
Image("東京タワー") と入力することで、プレビュー画面に東京タワーが映し出されましたね。 続いてデザインしていきます。

struct CircleImageView: View {
    var body: some View {
        Image("東京タワー")
            .clipShape(Circle())
            .overlay(
                alignment: .center,
                content: { Circle().stroke(Color.white, lineWidth: 4) }
            )
            .shadow(radius: 7)
    }
}

Please Type!
コードの説明をします。

            .clipShape(Circle())

以上で画像を円形に切り抜きます。

            .overlay(
                alignment: .center,
                content: { Circle().stroke(Color.white, lineWidth: 4) }
            )

以上は円を白色の 4px のせんで縁取ります。

            .shadow(radius: 7)

以上は半径7px分影をつけます。

円形の画像ができました
マップビューを作ろう
SwiftUI View では MapKit という別のフレームワークを使うことで地図を作ることができます。
この地図を MapView (マップビュー)と呼びます。

早速マップビューを作ってみましょう。

新しいSwiftUI View を作成します。
File ＞ New ＞ File から新しいファイルを作成します。テンプレートは iOS の SwiftUI View 、ファイル名は MapView.swift にします。

SwiftUI View を選択
コードが生成されたら、まず MapKit をインポートしましょう。

//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
Please Type!
では、地図を表示させましょう。MKCoordinateRegion を使い位置情報などを指定していきます。
位置情報を設定したら、テキストビューを表示していたところにMapを表示させましょう。
以下のコードを追加します。

import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.658_584, longitude: 139.745_431),
        span: MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009)
    )

    var body: some View {
        Map(coordinateRegion: $region)
    }
}

MapView.swift
center: CLLocationCoodinate2D は表示領域の中心を緯度、経度で指定しています。
今回は東京タワーの位置情報を示したいので latitude(緯度): 35.658_584, longitude(経度): 139.745_431 とします。
span: MKCoordinateSpan は表示領域の縮尺を示します。単位は度（°）です。地球は中心角が 1 度につき距離（円周）は約111kmだそうです。今回は縮尺を 1km にしたいので緯度、経度ともに 0.009 度にします。
Map の変数に $ をつけたのは、値に代入ができるようにです。ユーザがスマホを操作したときの値を代入できるようにしておくことで、地図を指で動かせるようにしています。

iOS 17 対応
Xcode 15 以降、以下のコードで 'init(coordinateRegion:interactionModes:showsUserLocation:userTrackingMode:)' was deprecated in iOS 17.0: Use Map initializers that take a MapContentBuilder instead. の警告が表示される可能性があります。

        Map(coordinateRegion: $region)
MapView.swift
iOS 17 も現状のコードで動作しますが、これを修正したい場合は以下のように編集してください。
このコードは iOS 17 以降で実行できます。

import MapKit

struct MapView: View {
    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 35.658_584, longitude: 139.745_431),
        span: MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009)
    ))

    var body: some View {
        Map(position: $cameraPosition)
    }
}

MapView.swift
ここまでできたらシミュレーターを動かしてみましょう。 キャンバス上のシミュレータの上の青いボタンを押すとライブモードになります。

青いボタンを押すとライブモードになる
詳細ビューを作ろう
ここまでで、名前と所在地、円形の画像、地図などが揃いました。 集まったツールを組み合わせてランドマークの詳細ビューのデザインを作成しましょう。

ContentView.swift を開きます。
MapView や CircleImageView も入れた大きなスタックを作りたいので、既存のスタックを VStack で囲み、MapKit と CircleImageView を挿入しましょう。
VStackで囲むには、囲みたい部分をcommand⌘ + クリックして Embed in VStack を選択すればよかったですね。今回の場合は VStack(alignment: .leading) の VStack をcommand⌘ + クリックします。


struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)

            CircleImageView()

            VStack(alignment: .leading) {
                Text("東京タワー")
                    .font(.title)
                HStack {
                    Text("東京都港区")
                        .font(.subheadline)
                    Spacer()
                    Text("東京都")
                        .font(.subheadline)
                }
            }
            .padding()
        }
    }
}

Please Type!Please Type!
追加したらライブモードにして地図や写真が表示されているか確認してみましょう。

MapView と CircleImageView が追加された
今は上下に並んでいるだけなので、配置をデザインを整えていきます。
地図と画像を重ねたデザインにしてみましょう。

    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            CircleImageView()
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text("東京タワー")
Please Type!Please Type!
                }
            }
            .padding()

            Spacer()
        }
    }
}
Please Type!
.ignoresSafeArea(edges: .top) は MapView を画面の上部いっぱいまで表示させています。 .offset(y: -130), .padding(.bottom, -130) は CircleViewImage をy軸つまり縦方向を130px上に移動しています（x軸は左が、y軸は一番上が0）。 Spacer() は余白を作っています。 これで見た目は整いましたね。

最後に、東京タワーの概要を入れましょう。

                    .font(.title)
                HStack {
                    Text("東京都港区")
                    Spacer()
                    Text("東京都")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)

                Divider()

                Text("東京タワーについて")
                    .font(.title2)
                Text("説明をここに追加する。")
            }
            .padding()


Divider() は区切り線です。 subheadline の修飾は各テキストからHStackへ移動し、カラーを二番目の色に設定しました。

今回の完成図
まとめ
SwiftUI では少ないコードでアプリケーションを構築できる。
VStack を使うとビューを縦向きに並べることができる。
HStack を使うとビューを横向きに並べることができる。
Stack は入れ子構造にすることができる。
MapKit を使うことでアプリケーションに地図を表示することができる。
練習問題
Q1:VStack を使うと要素はどのように並びますか？

×
：左右に並ぶ
○
：上下に並ぶ
×
：前後に重なる
Q2:次のSwiftコードで表示されるのはどの画面ですか？

var body: some View {
    HStack {
        CircleImageView()
        VStack(alignment: .leading) {
            Text("東京タワー")
                .font(.title)
            Text("東京都　港区")
        }
    }
}

×
：CircleImageView.swift
○
：ContentView.swift
×
：MapView.swift
Q3:SwiftUI で Map を使うためにインポートするフレームワークは以下のうちどれですか？

×
：UIKit
×
：AppKit
○
：MapKit
練習問題の解答解説
答えを隠す

A1:正解はイです。左右に並ぶのは HStack 前後に重なるのは ZStack でしたね。

A2:正解はアです。横並びになる HStack の中に CircleImageView と VStack が内包されていますね。

A3:正解はウです。MapKit を使うことで Map を表示することができます。

お疲れさまでした！
学習したことをSNSで報告しよう！

---
## リンク
[App](https://developer.apple.com/documentation/swiftui/app)

[Scene](https://developer.apple.com/documentation/swiftui/scene)

[View](https://developer.apple.com/documentation/swiftui/view)

[View/body](https://developer.apple.com/documentation/swiftui/view/body-8kl5o)

[VStack](https://developer.apple.com/documentation/swiftui/vstack)

[PreviewProvider](https://developer.apple.com/documentation/swiftui/previewprovider)

[PreviewProvider/previews](https://developer.apple.com/documentation/swiftui/previewprovider/previews-swift.type.property)

[MapKit](https://developer.apple.com/documentation/mapkit)

[Swift/Attributes(属性)](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/attributes/#main)
