![fv](https://github.com/go5go69/yumemi-flutter-codecheck/assets/71274816/c94fa37c-149d-4206-b373-0c0e6a27bf6a)
# yumemi flutter codecheck


## Getting Started
このFlutterプロジェクトにはfvmを利用しています。  
`fvm flutter pub get`  
を実行してください。  

また、Flavorによる以下の環境分けを行っています。
- dev
- prd

dev環境のdebug実行コマンド  
`flutter run --debug --flavor dev --dart-define=FLAVOR=dev`

prd環境のdebug実行コマンド  
`flutter run --debug --flavor prd --dart-define=FLAVOR=prd`

※VSCodeの場合は `launch.json` を作成しています。  

## 要件
[要件定義はこちらから](https://aluminum-weeder-2d6.notion.site/2a8c4373bf664f5188a0b8e9b2cb9026)

## アーキテクチャ
[アーキテクチャ概要はこちらから](https://aluminum-weeder-2d6.notion.site/e93f23af977b43919e61f1e51e82adb1?pvs=4)

## Features
### 1.検索と結果の表示
検索、概要の表示、リポジトリの詳細を表示することができます。  
![search_detail](https://github.com/go5go69/yumemi-flutter-codecheck/assets/71274816/b19b7401-8c95-4b0c-b6fb-14b5ab6a9eb6)

### 2.テーマ変更
ユーザーインタラクションによってテーマを変更することが可能です。
![theme](https://github.com/go5go69/yumemi-flutter-codecheck/assets/71274816/6385ff73-9eb6-48ce-8cd2-fb7eb7c00551)

### 3.言語変更
ユーザーインタラクションによって言語を変更することが可能です。  
選択できる言語は以下です。
- 英語
- スペイン語
- 日本語
- 中国語

※スペイン語と中国語に関しては[ChatGPTを使って翻訳](https://github.com/go5go69/yumemi-flutter-codecheck/pull/17)を行ったため、自然な表現でない可能性があります。  
![language](https://github.com/go5go69/yumemi-flutter-codecheck/assets/71274816/b411cfcb-76d9-4b8c-b0a6-9690c7498c8b)

## 開発スケジュール
[WBSはこちらから](https://docs.google.com/spreadsheets/d/1WWjMd65853NrDJEDuD1YO2fXmgMr6n1tH9_LLnleq9E/edit?gid=0#gid=0)

## チケット管理
[チケット管理はこちらから](https://aluminum-weeder-2d6.notion.site/48cb7b132d4648578bc809e001dd31da)
