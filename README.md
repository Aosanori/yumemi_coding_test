# yumemi_coding_test

GitHubのリポジトリを検索するアプリです。

## Requirement
* flutter 3.10.5
* expansion_tile_card: ^3.0.0
* flutter_picker: ^2.1.0
* flutter_riverpod: ^2.3.6 
* flutter_vector_icons: ^2.0.0
* font_awesome_flutter: ^10.5.0
* freezed_annotation: ^2.2.0
* http: ^1.1.0
* intl: ^0.18.1
* json_annotation: ^4.8.1
* lazy_load_scrollview: 1.3.0
* mockito: ^5.4.2
* build_runner: ^2.4.6
* flutter_lints: ^2.0.0
* freezed: ^2.4.0
* json_serializable: ^6.7.1
* network_image_mock: ^2.0.1

## Usage

実行までのコマンド
```bash
cd ios
sudo arch -x86_64 gem install ffi
flutter pub get
pod install
flutter run
```

## アーキテクチャ
riverpodを用いてLogicとViewを分離したMVCを採用した 

![Architecture](https://github.com/Aosanori/yumemi_coding_test/blob/main/assets/yumemi_architecture.png)

## やったことのまとめ
- アーキテクチャ・ロジック
    - riverpodを用いてロジックとビューを分離したMVCアーキテクチャ採用し実装した
        - AsyncValueを用いることで非同期操作のロード/エラー状態の処理を確実にできるようにした
        - APIを叩くためのAPIClientと取得されたデータを整形するDataSource層に分けた
            - APIClientは共通化されているので別のデータを取りたい時もそれを使えば取れるようになっている
            - APIClientはProviderを用いてDIできるような形にしてテストを行いやすくした
            - freezedを用いいることでデータの整形を容易にした
        - 機能を拡張しやすい、保守しやすい、可読性への寄与
- 検索欄
    - 検索欄が空白の時は検索欄の下に空白である旨を表示するようにした
    - 空白をクエリ用に+に変換する処理を追加した
- 結果表示部
    - 遅延読み込みを用いることで読み込みを早くするだけでなく、無駄なローディングも防ぐようにした
    - 検索結果が空の時はそれを表すアイコンとメッセージを大きく表示することでわかりやすくした
    - ネットワークのエラーの場合はそれを表すアイコンとメッセージを大きく表示することでわかりやすくした
- GitHub Actionsを用いて静的解析・テストを自動化した
- lintはriverpodのプロジェクトに準拠している
- ダークモードも対応済


