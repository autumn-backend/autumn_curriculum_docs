# 新規社員向け導入手順

<br>

## Slack について

Autumn の Slack に`#00_新規入社の方へ`というチャンネルがあります。そちらに入り、全ての Slack チャンネルに参加してください <br />
※ フロントエンド・バックエンドは所属分のみで大丈夫です。
<br><br>

## カリキュラムの運用について

[カリキュラム運用シート](https://docs.google.com/spreadsheets/d/1U9LFo-4XtFK7y10jNKO7snRLKP6k1mmWKzxaAkMWv1I/edit#gid=201315594&range=A1)
<br />

カリキュラムは、メンター制度のもと運用をしています。所属チームはスプレッドシートの**チーム編成**シートを参照してください。
<br><br>

## カリキュラムの進め方について

### カリキュラムページ

#### フロントエンド

[フロントエンドカリキュラム](https://frontend-curriculum-234036219-aziozrez5a-an.a.run.app)

#### バックエンド

[バックエンドカリキュラム](https://www.autumn-group.com/%e3%83%90%e3%83%83%e3%82%af%e3%82%a8%e3%83%b3%e3%83%89%e3%82%ab%e3%83%aa%e3%82%ad%e3%83%a5%e3%83%a9%e3%83%a0/new_%e4%ba%8b%e5%89%8d%e6%ba%96%e5%82%99%e3%83%90%e3%83%83%e3%82%af%e3%82%a8%e3%83%b3%e3%83%89/)

<br>
カリキュラムの進め方は、上記カリキュラムページを見ながら、作業用リポジトリで作業をしてください。<br />

ある程度の問題文と必要なコードは作業用リポジトリに記載してあるため、どんどん進められる人は作業用リポジトリを見て進め、<br />
わからない部分だけカリキュラムページを見るでも構いません。
※ 作業リポジトリは個別配布します
<br><br>

## カリキュラムの提出について

カリキュラムの提出はプルリクエストの機能を用いてください。<br>
また、課題について質問があればイシューの機能を活用します。<br>
コミット〜プッシュまで完了し、プルリクエストを作成したら Slack でメンターにレビュー依頼をしてください。

## カリキュラムの導入手順

### 1. git clone をする

💡 「$」マークは除いて、ターミナル(Mac)またはコマンドプロンプト(Windows)で以下のコマンド実行してください。
<br>
💡 「//」はコメントなので無視してください。

```
// Windowsの方のみ以下を実行
$ cd Desktop
// 作業ディレクトリ作成＋移動
$ mkdir workspace && cd workspace
$ git clone （作業リポジトリのURL）
```

### 2. VSCode でクローンしたフォルダを開く

先ほど clone したフォルダを VSCode で開いてください。

### 3. ブランチを切り替える

#### コマンドでする場合

```
$ git checkout ブランチ名
```

#### GUI 操作でする場合

<img width="874" alt="checkout" src="https://user-images.githubusercontent.com/67848399/159731664-331b8045-5173-4dc5-b0ef-75a3c3f7cbf1.png">

## Github のメイン機能

Github では、主に以下の機能を活用します。

### branch

ブランチとは、作業環境です。通常の開発環境では、一般的に以下のように切り分けます。

- main/master : ユーザーへのリリース環境
- release : リリース前の環境（最終チェック）
- develop : 開発環境
- fix : 修正用
- hotfix : 緊急対応用

今回は、学習用のため、以下のようにして運営します。

- main : メインブランチ（絶対に編集しない）
- mentor : レビュー（提出先）ブランチ
- ◯_◯◯◯◯ 　: 作業ブランチ
  <br><br>

## 命名規則

カリキュラムを進める際に、命名規則というのがとても重要です。<br />
命名規則に従えば、プロジェクト全体の統一感が出て運用もしやすくなります。<br />
逆に、命名規則のない自己中心的な命名をしてしまうと、可動性も低くなる上、運用の負担がかかってしまいます。<br />
命名規則といえど、チームで勝手に設定するわけではなく、公式で指定がある規則に従います。

### フロントエンドの命名規則

#### HTML/ CSS / Sass

**FLOCSS**
<br>
https://haniwaman.com/flocss/
<br>
https://github.com/hiloki/flocss

#### JavaScript

https://cou929.nu/data/google_javascript_style_guide/#
<br>
http://memopad.bitter.jp/w3c/js/js_conventions.html

#### TypeScript

https://typescript-jp.gitbook.io/deep-dive/styleguide

#### React

フレームワークの場合、それ用の命名規則がありますが React はライブラリです。<br />
JavaScript ライブラリのため、基本は JavaScript または TypeScript の規則に準拠します。

### バックエンドの命名規則

#### SQL(MySQL)

https://dev.mysql.com/doc/refman/8.0/ja/

#### PHP

**PSR-2**
<br>
https://qiita.com/katsukii/items/e68183f14407722de9cc#psr-2
<br>
http://www.infiniteloop.co.jp/docs/psr/psr-2-coding-style-guide.html

#### Laravel

https://laraweb.net/knowledge/942/
<br>
https://qiita.com/gone0021/items/e248c8b0ed3a9e6dbdee

### Git の命名規則

#### コミットメッセージ(commit)

コミットメッセージは、規則に従って記述をしましょう。

```
[課題No][作業内容]概要
```

`作業内容は以下から選択`

- new :　新規
- retry : やり直し
- fix : レビュー後修正
- env : 環境構築系
- temp : 一時提出（issue 用）
- other : その他

**悪い例** <br>

> Lesson １ 0 <br>
> Lesson10 修正 <br>

**良い例** <br>

> [JS_1-1][new]初回提出 <br> > [JS_1-1][fix]計算ロジックの修正 <br>

💡 第三者が見ても「どんな作業をしたか」が明確になるよう心がけましょう。

#### プルリクエスト(pull request)

**タイトル**

```
【提出者名】概要
（例）
【k_yuta】 JavaScript課題提出（1-1 ~ 1-4)
```

**本文**

```
提出課題一覧
【JS_1-1】
【JS_1-2】
【JS_1-3】
【JS_1-4】
...

メッセージ
```

#### イシュー(issue)

基本は以下のテンプレートに準拠すること
**タイトル**

```
【課題No or セクション】【提出者名】概要
（例）
【JS_5-1】【k_yuta】エラーの解消方法がわからない
```

**本文**

```
### 最終的なゴールは何か（必須）
（例）・phpの条件分岐をうまくいくようにしたい

### 現状のエラー・課題（必須）
概要
現状のプログラムコード
ここにコードを添付
※ issueを立てると同時に現段階をプッシュしておくこと

### エラーコード
ここにコード

###解決への推測（必須）
現段階で、「これができればうまくいくのでは？」という推測を記入

コメント
※何かあれば書いてください
```

#### ブランチ(branch)/リポジトリ(repository)

フルネームをスネークケースで作成<br />
（例） 大月裕太の場合、y_otsuki

## デプロイ手順

https://github.com/autumn-backend/autumn_curriculum_docs/wiki/%E3%83%87%E3%83%97%E3%83%AD%E3%82%A4%E6%89%8B%E9%A0%86
