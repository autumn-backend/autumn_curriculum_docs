---
title: "HTML・CSSの事前知識"
---

# 1.HTML・CSS 学習の概要を理解しよう

Web ページの構造を作る HTML と、見た目を調整する CSS について学びます。

## Web サイトの仕組み

いつも何気なく見ている Web サイトですが、実際にどのような仕組みをしているか学びましょう

### インターネットとは？

世界中のコンピュータなどの情報機器がいろんな情報を交換できる仕組みです。

### Web とは？

インターネットを利用し、Web サイトを公開したり、閲覧できる仕組みです。

#### Web ページの仕組み

Web ページを閲覧する上で必要なものが「Web サーバー」と「Web クライアント」です。
Web サーバー内にいろんな人が作った Web ページが保管されており、
Web クライアントが Web サーバーに検索したい内容を「要求（リクエスト）」して、
Web サーバーがそれに「応答（レスポンス）」することで、Web クライアントに検索したいものが表示されます。
![](https://storage.googleapis.com/zenn-user-upload/b7a69ff786b2-20220308.png)

[いまさら聞けない「Web ブラウザ」超入門](https://atmarkit.itmedia.co.jp/ait/articles/0804/14/news107.html)より引用

### Web ブラウザとは？

Safari、Google Chrome などの WEB サイトを閲覧するために使うソフトのことです。

Web サーバーから送られてくる Web ページのデータは、アルファベットや記号から成り立つ暗号のような「コード」で書かれているので、快適に Web ページを閲覧することができません。

そこで、Web ブラウザがコードを解読し、普段見ているような Web ページに表示させます。
![](https://storage.googleapis.com/zenn-user-upload/9a7841efe44c-20220308.png)

### デベロッパーツールとは

デベロッパーツールは、Chrome が提供する機能の１つです。
Web サイトの要素を確認したり、サイトのコードを試しに編集することができます。
HTML や CSS の文が、そのまま目に見えて動くのでとてもわかりやすく、Web デザインの仕事でもよく使われています。
ほかにもページの速度を計測したり、JavaScript のエラーを確認するなど、さまざまな機能があるため、使い方に慣れたら調べてみましょう。

### インターネットとは？

世界中のコンピュータなどの情報機器がいろんな情報を交換できる仕組みです。

---

# 2.HTML の基本書式を学ぼう

HTML や CSS の基礎書式を学習していきます。

## HTML を書いてみよう

① デスクトップ上に「test」フォルダを作成。
② 新規で「VScode」を開き、test フォルダを開く。
③ フォルダの中に、「index.html」ファイルと「style.css」ファイルを作成。
![](https://storage.googleapis.com/zenn-user-upload/39219f8faa28-20220308.png)

④「index.html」ファイルで「！」を入力後、エンターを押す。
![](https://storage.googleapis.com/zenn-user-upload/5d9bc16f49ab-20220308.png)

⑤ 下記が表示される。これが HTML ファイルの基本構成です。 各要素は後ほど説明します。
![](https://storage.googleapis.com/zenn-user-upload/e904fe577da4-20220308.png)

⑥「body」内に文字を入力する。
![](https://storage.googleapis.com/zenn-user-upload/a698197f4872-20220308.png)

⑦Google Chrome に「index.html」ファイルをドラッグ＆ドロップしましょう。
※「safari」や「Firefox」などの別ブラウザでも同じ事ができます。
![](https://storage.googleapis.com/zenn-user-upload/23df51221dc6-20220308.png)

⑧「body」内に記載した内容が表示される。
![](https://storage.googleapis.com/zenn-user-upload/0e1d514f8719-20220308.png)

タグについて
タグとは？
HTML では、コンピュータに「文書構造」を理解してもらうために、
タグ付け（Markup：マークアップ）と言われる、< >（大なり小なり）の記号で、
文章をその意味ごとに囲んで作成していきます。

何故、このタグ付けが必要かというと、
コンピュータは人間のように、Web ページに表示されている文章を読んで、文章の意味や内容、構造を判断できません。
そこで文章構造を理解できるように「タグ付け」を行います。

適切な「タグ付け」を行うことによって、
検索エンジンがあなたの作ったページを正確に認識し、SEO で検索順位を上げることができたり、
音声ソフトを利用している視覚的に不自由な人に対しても、正確な情報を伝えることができたりするので、
タグ付けはかなり重要なことです。
![](https://storage.googleapis.com/zenn-user-upload/2cae9b016427-20220308.png)

### タグの種類

HTML タグは、現在、100 を超える種類があります。ですが、これらをすべて暗記する必要はありません。
都度、調べながら適切だと思うタグを選び、使っていく内に、よく使うタグを覚えれば大丈夫です。

#### 参考

http://html-coding.co.jp/annex/dictionary/html/
https://www.tagindex.com/html_tag/elements/
http://www.johoka.net/kihontag.htm

### タグの規則

・開始タグと終了タグで囲う（一部例外あり）

```html
<h1>大見出し</h1>
```

・終了タグが不要なもの

終了タグを持たない要素もあります。この要素のことを「空要素（からようそ）」と呼びます。
代表的な空要素には、以下のようなものがあります。

```html
<img src="”aaa.jpg”" />：画像を表示する <br />：改行
```

#### タグの属性と値について

通常 HTML タグに補足的な情報を与える目的で使われます。

#### 例

**href 属性**
ボタンを押したときに外部のページや内部の別のページなどに遷移することができます。

```html
<a href="https://www.google.co.jp/">Google Japanのリンク</a>
```

**src 属性**

タグで表示させたい画像の場所を指定し、表示させます。
```html
<img src="sample.png">
```

**alt 属性**

タグでうまく表示されなかったときの代替のテキストを表示させます。
```html
<img src="sample.png" alt="サンプル画像">
```

### タグの入れ子関係

下記のように、タグの中にタグがあることを「入れ子」と言います。
また、「入れ子」にはルールがあり、入れ子にしていいものとそうでないももあります。

都度、下記サイトを参考に、適切なタグを選択しましょう。
https://webliker.info/46840/

```html
<div>
    <h1>OK 入れ子ルール</h1>
</div>

<p>
    <h1>NG 入れ子ルール</h1>
</p>
```

## HTML の基本構造について

HTML の構造を理解しましょう。
![](https://storage.googleapis.com/zenn-user-upload/b1455f9286ab-20220308.png)

**html 要素**
html 要素は、この文書が HTML の文書であることを表します。

```html
<!DOCTYPE html>
```

HTML にはいくつかのバージョンがあります。この HTML ファイルがどのバージョンの HTML で書かれているかを宣言しています（DOCTYPE 宣言）。HTML のバージョンによって記述方法が異なります。
現行のバージョンは「HTML5」で、特に指定をしなければ、現行のバージョンが利用されます。

```html
<html lang="en">
  　　〜　　
</html>
```

HTML の文章であることを示しています。
「lang」属性は、Web ページの言語を設定できる部分です。
「en」が English
「ja」が Japanese
になります。

通常は「ja」に変えるようにしましょう。
**head 要素**

```html
<meta charset="UTF-8" />
```

meta 要素は、ページの情報を定義する要素です。「UTF-8」は、コンピュータでの文字の処理方法（文字コード）の 1 つです。
この指定がないと、ブラウザ上の文字が化けてしまいますので、必ずつけるものです。

#### 文字化けの例

![](https://storage.googleapis.com/zenn-user-upload/52ba1bbf6b26-20220308.png)

```html
<title>Document</title>
```

ページ上には表示されませんが、ブラウザのツールバーや検索エンジンの検索結果のページ名になります。
![](https://storage.googleapis.com/zenn-user-upload/86e0131398d1-20220308.png)

**body 要素**

```html
<body>
  〜
</body>
```

ブラウザに表示される部分になります。

---

# 3.CSS の基本書式を学ぼう

## CSS を書いてみよう

① 先程作成した「test」フォルダーを開きます。
②「test」フォルダーの中に「index.html」と「style.css」が同じ階層にあることを確認
![](https://storage.googleapis.com/zenn-user-upload/8951b85f51c4-20220308.png)

③index.html ファイルを下記のように記載し、CSS ファイルを読み込ませる。

```html
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="style.css" />
  </head>

  <link rel="stylesheet" href="style.css" />
</html>
```

**rel 属性**　 ：　現在のファイルとリンク先ファイルとの関係性を指定する（CSS は、stylesheet と記述）
**href 属性**　：　読み込む外部ファイルを指定する。

④body に下記を追加

```html
<body>
  <p>クラスなし</p>
  <p class="test">クラスあり</p>
  <p id="sample">IDあり</p>
</body>
```

⑤index.html ファイルをブラウザで表示
![](https://storage.googleapis.com/zenn-user-upload/cac2170cdf82-20220308.png)

⑥style.css で下記のように記載

```html
p{ color: red; }
```

⑦index.html ファイルをブラウザで表示
　文字の色が変われば成功

※色が変わらない場合 ② と ③ と ⑥ を見直してください。

⑧style.css で下記のように記載![](https://storage.googleapis.com/zenn-user-upload/0f0700c6b05b-20220308.png)

```html
p { color: red; } .test { color: blue; } #sample { color: green; }
```

⑨index.html ファイルをブラウザで表示
　文字の色が変われば成功
![](https://storage.googleapis.com/zenn-user-upload/081ad068a938-20220308.png)

## CSS を読み込む方法

CSS を読み込む方法は色々あります。
一番基本的なやり方は ① になります。

①HTML ファイルから外部 CSS を読み込む

```html
<head>
  <link rel="stylesheet" href="ファイル名" />
</head>
```

② タグの style 属性を使い書く

```html
<p style="color: red;">クラスなし</p>
```

③HTML ファイルに<style>を用いて書く

```html
<body>
  <p>クラスなし</p>

  <style>
    p {
      color: red;
    }
  </style>
</body>
```

### <link>タグを用いて、CSS を読み込む方法

link タグとは「そのページ」と「別のファイルやページ」を関連づけるためのタグです。
CSS を読み込む以外にも利用方法があるので、<link>タグについて理解しましょう

#### link タグの書き方：rel と href の意味は？

基本的な書き方は下記です。
![](https://storage.googleapis.com/zenn-user-upload/4d66646e5a43-20220308.png)

「rel 属性」はファイルとの関係性になります。
読み込みたいファイルの種類によって、属性値が変わります。
![](https://storage.googleapis.com/zenn-user-upload/9fa1e27075a0-20220308.png)

href 属性は外部ファイルなどを参照するのに、URL/URI やパスなどで記述する場所になります。

#### llink タグの利用方法

① 同じフォルダー内の CSS ファイルを読む
一般的な CSS の見込み方です。
CSS を読み込ませるので、rel の属性値は「stylesheet」になります。

```html
<link rel="stylesheet" href="style.css" />
```

②web 上で公開されているスタイルシートを読み込む
「ress」という、ネット上に公開されている CSS のコードを読み込んでりようすることもできます。

```html
<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css" />
```

中身　：　https://github.com/filipelinhares/ress

③web サイトのアイコンを指定
web ブラウザの上に表示されるアイコンも設定可能です。

```html
<link rel="icon" href="autumn_logo.jpg" />
```

### パスの指定方法

#### パスとは？

パスとは特定のファイルの場所までの道筋を記述したものです。
分かりやすく言うと、目的のファイルまでの住所になります。

html においては下記のタグでパスを使用することが多いです。

- <a>タグの href 属性（リンク先）
- <img>タグの src 属性（読み込みたいファイルの場所）
- <link>タグのhref属性（外部ファイルの読み込み）

### パスの種類

パスには 2 種類あり、「絶対パス」と「相対パス」があります。

#### 絶対パス(Absolute path)

最上位に位置するディレクトリ（ルートディレクトリ）から、対象のファイルまでの道順(階層構造)をすべて記述する方法になります。
基本的には、http://~”や”https://~から始まります。

例
![](https://storage.googleapis.com/zenn-user-upload/216e9e9065fd-20220308.png)

#### 相対パス(Relative path)

現在いるファイルから対象のファイルまでの道順(階層構造)を記述する方法になります。

例 1
![](https://storage.googleapis.com/zenn-user-upload/61e2f232751b-20220308.png =500x)
![](https://storage.googleapis.com/zenn-user-upload/7fe70d5566a2-20220308.png =500x)

---

# 4.HTML/CSS を書いてみよう 1

HTML や CSS を実際に使って行きます。

### ファイルをダウンロードして、sample ファイルを見てみよう

https://github.com/Autumn-Frontend/curriculumn

### CSS の書き方

◆sample/lesson01
CSS のスタイルの当て方は下記のように書きます。<p>タグの色を赤色にするという書き方です

```html
p{ color:red; } どこの（セレクタ）{ なにを（プロパティ）：どうする（値）; }
```

### スタイルの使い分け

スタイルシート(CSS)を記述する際に、「特定の要素すべて」を一括して装飾したい場合と、「特定の要素のうち一部だけ」を装飾したい場合が発生します。

この問題を解決するために「id 属性」や「クラス属性」を用いて命名することで、要素を区別することができます。

「特定の要素すべて」を一括して装飾したい場合
この場合は「タグ」を用いて、スタイルを適用します。これにより、全ページに共通のスタイルを当てることができます。

html

```html
<p>タグ</p>
<p>タグ</p>
<p>タグ</p>
<p>タグ</p>
```

css

```css
p {
  color: red;
}
```

#### 「特定の要素のうち一部だけ」を一括して装飾したい場合

この場合は「CLASS」や「ID」に命名して、スタイルを適用します。

#### ID の場合

html

```html
<p id="id">タグ</p>
```

css

```css
#id {
  color: blue;
}
```

#### CLASS の場合

```html
<p class="class">タグ</p>
```

css

```css
#id {
  color: green;
}
```

### ID と CLASS の役割の違い

要素を区別するという目的であれば同じですが、使われ方が異なります。

#### CLASS の場合

同じ Web ページ内で同じ CLASS 属性の値を何度でも用いることができる
下記の記載ができる。

```html
<p class="class">タグ</p>
<p class="class">タグ</p>
```

ID の場合
同じ Web ページ内で同じ ID 属性の値は一度しか使えない。下記の記載ができない。

```html
<p id="id">タグ</p>
<p id="id">タグ</p>
```

ID を使う場面としては下記のような状態です。生徒という括り（CLASS）があって、生徒の中でも学籍番号（ID）で区別したい場合など

```html
<p class="students" id="01">生徒01</p>
<p class="students" id="02">生徒02</p>
<p class="students" id="03">生徒03</p>
```

## CSS の読み込み順

◆sample/lesson02

CSS は上から順に読み込み、重複されたものは上書きされる。下記コードを見てみましょう。
text1 に対し、color の指定を 2 回を行っています。CSS は上から順に読み込んでいるので、最後に記載したものが、最終的に適用されます。
html

```html
<p class="text1">color</p>
```

css

```css
.text1{
    color:red;
    color:blue; # こちらが適応される
}
```

優先順位を変える方法
CSS は上から順に読み込みますが、強制的に優先順位を変更する方法があります。

プロパティ値の右側に「!important」と記載することで、強制的に適用する方法もあります。

**※注意**
ただし、このやり方に関しては、運用保守性の観点から、使い方によっては好まれない傾向がありますので、よっぽどのことが無い限り、使わないようにしましょう。
html

```html
<p class="text2">color</p>
```

css

```css
.text2{
    color:red !important; # こちらが適応される
    color:blue;
}
```

### CSS ファイルの読み込む順番

HTML の<head>タグ内に記載してある、<link>タグも上から順番に読み込みます。

lesson01 をブラウザで表示すると、style.css に指定していないのに、background-color が適用されています。

こちらは、<head>タグ内に「base.css」を「style.css」の前に読み込んでいます。この base.css に background-color の指定があるので、背景色を変更しています。
html

```html
<head>
  <link rel="stylesheet" href="../../base.css" />
  <link rel="stylesheet" href="style.css" />
</head>
```

css

```css
body {
  background-color: antiquewhite;
}
```

試しに、「style.css」に background-color を適用して、上書きしてみます。コメントアウト部分（緑色の部分）にカーソルを合わせ、下記コマンドでコメントアウトを解除します。

**mac**
`「command」+ 「/」`
**windows**
`「ctrl」+「/」`
↓ コメントアウトされる。複数行でも可能。

```css
body {
  /* background-color: antiquewhite; */
}
```

### ブロックを作成しよう

◆sample/lesson03

#### <div>タグでブロックを作ろう

領域の設定には、<div>タグを使います。<div>タグは、タグとしての特別な意味は持っていません。

逆に、<header>タグなどはタグだけを見て、ここが header 部分だとわかるように意味を持ちます。

タグだけでは意味を表現するのに難しいときに、<div>タグのような意味をもたないタグが活躍します。

まず下記のように<div>タグを記載しましょう。

```html
<body>
  <div class="box1"></div>
</body>
```

この状態で、Web ブラウザで表示させましょう。しかし、これだけではまだ何も見えません。
何故ならば、領域に対して横幅と高さ、色が指定されていないからです。

width と height を指定しよう
width は、横幅を設定します。height は、高さを設定します。
まずは下記を記載しましょう。

```html
.box { height: 200px; width: 100px; }
```

※width と height を指定する方法

> px：周りの要素に左右されない、絶対的な幅を指定できます。
> %：親の要素に対しての割合
> auto：親の要素と同じ横幅になります。
> vh：縦の画面サイズに対しての割合
> vw：横の画面サイズに対しての割合
> etc

background-color を指定して見えるようにしましょう。
下記を記載してから、Web ブラウザで表示させてみよう。

```html
.box { height: 200px; width: 100px; background-color: lightgoldenrodyellow; }
```

※色の指定方法

- 色の名前
  background-color: red;
- 16 進数カラーコード
  background-color: #ff0000;

etc

### 原色大辞典

https://www.colordic.org/

色々な指定方法を見てみよう

#### 「％」を使った方法

「%」は親要素の大きさに対して、%で割合を出せます。

.box2 の親要素は<body>タグになるので、<body>タグの横幅の 50%分広がります。
.box3 の親要素は.box2 なので、.box2 の 50%の横幅が広がり、高さは 70%分広がります。

html

```html
<div class="box2">
  <div class="box3"></div>
</div>
```

css

```css
.box2 {
  width: 50%;
  height: 200px;
  background-color: skyblue;
}

.box3 {
  width: 50%;
  height: 80%;
  background-color: cornflowerblue;
}
```

#### 「vw（viewport width）」を使った方法

「vw」は表示している横の画面幅に対しての割合になります。横の画面幅を変えると、要素の大きさも変化します。試しに確認してみてください。

基準としては、100vw が 100%相当、10vw が 10%相当

html

```html
<div class="box4"></div>
```

css

```css
.box4 {
  width: 40vw;
  height: 20vw;
  background-color: yellow;
}
```

「vh（viewport height）」を使った方法
「vh」は表示している縦のの画面幅に対しての割合になります。縦の画面幅を変えると、要素の大きさも変化します。試しに確認してみてください。

基準としては、100vh が 100%相当、10vh が 10%相当
html

```html
<div class="box5"></div>
```

css

```css
.box5 {
  width: 40vh;
  height: 20vh;
  background-color: orange;
}
```

width を指定しない
width を指定しない場合、デフォルト値として width:auto;が適用されます。
auto は親要素（今回は<body>タグ）の横幅分広がります。
html

```html
<div class="box6"></div>
```

css

```css
.box5 {
  /* width: auto; // デフォルト値 */
  height: 100px;
  background-color: lightgreen;
}
```

## ブロックの中にブロックを作ろう

◆sample/lesson04

①<div>タグの中に<div>タグを記載します。

```html
<div class="box1">
  <div class="box2"></div>
</div>
```

② スタイルを当てます

```css
.box1 {
  width: 200px;
  height: 200px;
  background-color: red;
}

.box2 {
  width: 100px;
  height: 100px;
  background-color: blue;
}
```

## ボックスモデルを理解しよう

◆sample/lesson05

HTML の要素はそれぞれ、要素を表示するための「表示領域」を確保します。これが「ボックス」です。CSS を利用すると、ボックスの幅や高さ、余白を設定できます。

検証ツール（デベロッパーツール）
sample/lesson0 をブラウザで開き、下記コマンドを押してください。

mac
`「command」+「option」+「i」`

windows
`「Ctrl」+「Shift」+「i」`

※右クリック後、「検証」でも OK

そうすると検証ツールが表示されます。この右側の部分で、HTML のコードや CSS の値を見ることができます。
![](https://storage.googleapis.com/zenn-user-upload/fd2902295c08-20220308.png)

<div class=”box1”>...</div>を選択すると、
box1に適用しているCSSの値とボックスモデルが確認できます。
![](https://storage.googleapis.com/zenn-user-upload/959117995e76-20220308.png)

ボックスモデルの解説

```css
.box1 {
  background-color: orange;
  width: 200px;
  height: 200px;
  margin: 50px;
  border: 10px solid skyblue;
  padding: 30px;
}
```

margin 　 要素の外側にある余白
![](https://storage.googleapis.com/zenn-user-upload/fb5d7f0b2539-20220308.png)

border 　　要素の外側の枠線
![](https://storage.googleapis.com/zenn-user-upload/171f0f48eea3-20220308.png)
padding 　 要素の内側にある余白
![](https://storage.googleapis.com/zenn-user-upload/a180887df109-20220308.png)

## border

◆sample/lesson06

border は、要素に枠線を指定するプロパティです。
実際に sample/lesson3 を参考に見てみましょう。

上下左右に border を入れる
border: 5px（線の太さ） solid（線の種類） cornflowerblue（線の色）;で指定する
html

```html
<div class="box1"></div>
```

css

```css
.box1 {
  width: 200px;
  height: 200px;
  background-color: coral;
  border: 5px solid cornflowerblue;
}
```

### border の位置を指定 / border の種類を変更

##### border-○○ で位置を指定

html

```html
<div class="box2"></div>
```

css

```css
.box1 {
  width: 200px;
  height: 200px;
  background-color: coral;
  border-top: 7px solid cornflowerblue; /* 上 */
  border-bottom: 7px solid cornflowerblue; /* 下 */
  border-right: 7px solid cornflowerblue; /* 右 */
  border-lett: 7px solid cornflowerblue; /* 左 */
}
```

## margin と padding

◆sample/lesson07

### margin

margin は要素の外側の余白になります。
html

```html
<div class="box1">
  <p>contents</p>
</div>
```

css

```css
.box1 {
  width: 100px;
  height: 100px;
  background-color: lightgreen;
  margin: 50px;
}
```

web
![](https://storage.googleapis.com/zenn-user-upload/0472e641b1ac-20220308.png)

### padding

padding は要素の内側の余白になります。

box1 と box2 で同じ高さと横幅で設定していますが、padding のみ大きさが変化します。

こちらはブロック要素のデフォルトの CSS プロパティ値で、box-sizing: content-box;が適用されているためです。box-sizing については次の章で説明します。

html

```html
<div class="box2">
  <p>contents</p>
</div>
```

css

```css
.box2 {
  width: 100px;
  height: 100px;
  background-color: lightgreen;
  padding: 50px;
}
```

web
![](https://storage.googleapis.com/zenn-user-upload/987490ac2dc6-20220308.png)

### margin、padding の指定方法

位置を指定する

```css
margin-top: 1px;
margin-right: 1px;
padding-bottom: 1px;
padding-left: 1px;
```

まとめて指定する

```css
margin: 1px; /* 値が1つの場合、上下左右に適応*/
margin: 1px 2px; /* 値が2つの場合、左が上下、右が左右*/
padding: 1px 2px 3px; /* 値が3つの場合、上 左右 下*/
padding: 1px 2px 3px 4px; /* 値が4つの場合、上 右 下 左*/
```

## margin を用いて、要素の位置を変える方法

◆sample/lesson08

margin は要素の外側に余白を作ることもできますが、
それを用いて、要素の位置を変える方法もあります。

中央寄せにするのに、margin:0 auto;は良う使うので、覚えていきましょう。
![](https://storage.googleapis.com/zenn-user-upload/1d071db36703-20220308.png)

## content-box と border-box を理解しよう

◆sample/lesson09

ブロック要素の box-sizing のデフォルト値は content-box になっています。
sample/lesson を開き、box-sizing 以外のプロパティ値を一緒にしたときの
ボックスの大きさの違いを見てみよう。

#### content-box

html

```html
<div class="content-box">
  <p>content-box</p>
</div>
```

css

```css
.content-box {
  width: 200px;
  height: 200px;
  margin: 20px;
  padding: 20px;
  border: 20px solid #fff;
  background-color: lightgreen;
  box-sizing: content-box;
}
```

web
![](https://storage.googleapis.com/zenn-user-upload/71b2fd2eac03-20220308.png)

#### border-box

html

```html
<div class="border-box">
  <p>border-box</p>
</div>
```

css

```css
.content-box {
  width: 200px;
  height: 200px;
  margin: 20px;
  padding: 20px;
  border: 20px solid #fff;
  background-color: lightskyblue;
  box-sizing: border-box;
}
```

web
![](https://storage.googleapis.com/zenn-user-upload/76f373b76936-20220308.png)

> content-box と border-box の表示領域を確認

**content-box の場合**
padding と border の分だけ、コンテンツ（要素）の横幅や高さが大きくなってしまいます。

**border-box の場合**
要素の横幅や高さは変化せずに、ボックスの中に padding と border を含んでくれます。

余計な計算を必要としない border-box のほうが扱いやすいため、一般的に使われています。「リセット CSS」を用いる場合、基本的に border-box を使います。
![](https://storage.googleapis.com/zenn-user-upload/6d69a5d2a37b-20220308.png)
![](https://storage.googleapis.com/zenn-user-upload/6278eca3459c-20220308.png)

## リセット CSS について

◆sample/lesson10

各ブラウザ（Google Chrome や Internet Explorer など）は、ブラウザ独自のデフォルト CSS を持っています。となると、各ブラウザによって表示のされ方に違いが発生します。

そこで、各ブラウザの表示のされ方を統一するためにリセット CSS を用いて制御します。リセット CSS は、ブラウザ独自の CSS を削除（リセット）するための CSS です。

ブラウザのデフォルト値を見てみよう
検証ツールを開き、各要素を選択するとブラウザごとのデフォルトの CSS を見ることができます。
![](https://storage.googleapis.com/zenn-user-upload/1ee0b626019b-20220308.png)

#### リセット CSS を適用し変化を見てみよう

① リセット CSS のファイルは「curriculumn/reset.css」に用意してあります。
②lesson/index.html に戻り、下記緑色（コメントアウト部分）にカーソルをあわせ、
　下記コマンドで緑色の部分を通常の文字色に戻します。

mac 　`「command」+ 「/」`
windows 　`「ctrl」+「/」`

```html
<hrad>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>lesson01</title>
<!-- <link rel="stylesheet" href="../../reset.css" /> -->
<link rel="stylesheet" href="../../base.css" />
<link rel="stylesheet" href="style.css" />
</head>
```

③ リセット CSS を読み込ませたい状態でブラウザで表示させましょう。
　デフォルトの CSS 無くした状態で表示されます。

このとき、ブロック要素の box-sizing が content-box から border-box に変更されます。リセット CSS を利用する場合は border-box を基準に制作する必要があります。
![](https://storage.googleapis.com/zenn-user-upload/8a861f10f375-20220308.png)

公開しているリセット CSS を見てみよう
リセット CSS のデータは下記サイトなどネット上に公開されています。今後、自身のポートフォリオを作成する際などに使いましょう。

https://webdesign-trends.net/entry/8137#i

---

# 5.HTML/CSS を書いてみよう 2

## ブロック要素、インライン要素、インラインブロック要素

◆sample/lesson11

タグの多くは、ブロック要素とインライン要素に分類されます。これらには、各特徴があるので確認してみましょう。

#### ブロック要素

ブロックレベル要素は、見出し・段落・表など、文書を構成する基本となる要素で、一つのブロック（かたまり）として認識されます。

#### インライン要素

インライン要素は、主にブロックレベル要素の内容として用いられる要素で、文章の一部として扱われます。

#### インラインブロック要素

インラインブロック要素とは、ブロックレベル要素とインライン要素の性質を併せ持った要素です。
横幅と高さの指定が可能で、横幅の初期値が内容で決まる等、他 2 つの要素に比べて直感的なコーディングができます。
display プロパティの記述を 1 行付け足すだけで、各要素をインラインブロック要素に変えることができます。
![](https://storage.googleapis.com/zenn-user-upload/cee53d14199d-20220308.png)

## 疑似要素

◆sample/lesson12

疑似要素は HTML 上に記載していない要素を CSS で追加することができます。

タグ名やクラス名、id 名などの後に::before や::after をつけ、content:内には、挿入したい文字などを書きます。

before は要素の直前に、after は要素の直後に要素を加えることができます。

### 疑似要素の例

html

```html
<p class="text">擬似要素</p>
```

css

```css
.text {
  color: red;
}
.text::before {
  content: "before";
  color: blue;
}
.text::after {
  content: "after";
  color: green;
}
```

web
![](https://storage.googleapis.com/zenn-user-upload/73cc2b971304-20220308.png)

## 疑似要素クラス

◆sample/lesson13

疑似クラスはセレクタに付加するキーワードのことで、選択される要素の特定の状態のスタイルを指定するものです。
実際に使い方を見てみましょう。

下記以外にも使い方は色々あるので、調べてみましょう。
https://developer.mozilla.org/ja/docs/Web/CSS/Pseudo-classes

### :nth-child()

:nth-child()は要素内のｎ番目にあたる要素にスタイルを指定できます。

番号指定
上から何番目の要素を指定

html

```html
<p>p1</p>
<p>p2</p>
<p>p3</p>
<!-- ここの色だけ変える -->
<p>p4</p>
<p>p5</p>
```

css

```css
p:nth-child(3) {
  color: red;
}
```

奇数（odd）、偶数（even）のみ指定
css

```css
p:nth-child(odd) {
  background-color: beige;
}
p:nth-child(even) {
  background-color: aliceblue;
}
```

web
![](https://storage.googleapis.com/zenn-user-upload/3ac5387a1ec7-20220308.png)

#### 何番目以降

n+● とすることで何番目以降の要素に対してスタイルを適用することが出来ます。

css

```css
p:nth-child(n + 2) {
  margin-top: 30px;
}
```

web
![](https://storage.googleapis.com/zenn-user-upload/2bcc0d2bcd40-20220308.png)

#### :hover

:hover は指定した要素にカーソルが合わさった時に、特定のスタイルを適用できます。

html

```html
<div class="box"></div>
```

css

```css
.box {
  height: 100px;
  width: 100px;
  background-color: tomato;
}
.box:hover {
  height: 200px;
  width: 200px;
  background-color: cornflowerblue;
}
```

web
![](https://storage.googleapis.com/zenn-user-upload/ce11e91241a1-20220308.png)

カーソルをあわせた状態
![](https://storage.googleapis.com/zenn-user-upload/792531a8e856-20220308.png)

## position

◆sample/lesson14

position プロパティを利用して、要素の位置をずらすことができます。
実際にプロパティ値を指定して、位置を確認します。

### position: static;（デフォルト値）

・static は書かなくても、もとから要素は static になっています。
・要素は通常の位置通りで、位置を指定することができません。

html

```html
<div class="box1">
    <dov class="box2"</div>
</div>
```

css
位置の指定ができない

```css
.box1 {
  background-color: darksalmon;
  width: 200px;
  height: 200px;
  position: static;
  top: 30px;
  left: 20px;
}
.box2 {
  background-color: azure;
  width: 100px;
  height: 100px;
  position: static;
  top: 20px;
  left: 50px;
}
```

web
![](https://storage.googleapis.com/zenn-user-upload/b6fd283223ee-20220308.png)

#### position: relative;

・基準位置は”指定した要素が本来配置される場所”
・位置の指定が可能
・absolute に対する基準位置になれる

css

```css
.box1 {
  background-color: darksalmon;
  width: 200px;
  height: 200px;
  position: relative;
  top: 30px;
  left: 20px;
}
.box2 {
  background-color: azure;
  width: 100px;
  height: 100px;
}
```

web
![](https://storage.googleapis.com/zenn-user-upload/8d4216c95537-20220308.png)

#### position: relative;

・absolute は、relative が指定されている”親要素”を基準にして、基準の位置を決定します。
・親要素に relative が無い場合、ブラウザ画面を基準位置としています。

親要素が relative の場合
css

```css
.box1 {
  background-color: darksalmon;
  width: 200px;
  height: 200px;
  position: relative;
  top: 30px;
  left: 20px;
}
.box2 {
  background-color: azure;
  width: 100px;
  height: 100px;
  position: absolute;
  top: 20px;
  left: 50px;
}
```

web
![](https://storage.googleapis.com/zenn-user-upload/3142c308ba08-20220308.png)

親要素が relative でない場合

css

```css
.box1 {
  background-color: darksalmon;
  width: 200px;
  height: 200px;
  /* position: relative; */
  top: 30px;
  left: 20px;
}
.box2 {
  background-color: azure;
  width: 100px;
  height: 100px;
  position: absolute;
  top: 20px;
  left: 50px;
}
```

web
![](https://storage.googleapis.com/zenn-user-upload/8fd3402ff881-20220308.png)

## float

◆sample/lesson15

前章でブロック要素は縦並びなる性質がありますが、float を用いて横並びにすることもできます。

float は要素を浮かせる
float は横並びにする時によく使われますが、本来の特徴としては要素を浮かせます。

float なしの状態
ブロック要素が 3 つあるので、縦に並びます。

html

```html
<div class="box1">
  <div class="box2">
    <div class="box3"></div>
  </div>
</div>
```

css

```css
.box1 {
  background-color: azure;
  width: 100px;
  height: 100px;
  /* float: left; */
}
.box2 {
  background-color: aqua;
  width: 150px;
  height: 150px;
  /* float: left; */
}
.box3 {
  background-color: cornflowerblue;
  width: 200px;
  height: 200px;
  /* float: left; */
}
```

web
![](https://storage.googleapis.com/zenn-user-upload/61a4d5c2b3b6-20220308.png)

float ありの状態（1 つのみ）
box1 のみ float を入れます。そうすると、box2 の上に box1 が表示されます。
これは box1 が float で浮いた状態になり、box2 の上に表示されているからです。

css

```css
.box1 {
  background-color: azure;
  width: 100px;
  height: 100px;
  float: left;
}
.box2 {
  background-color: aqua;
  width: 150px;
  height: 150px;
  /* float: left; */
}
.box3 {
  background-color: cornflowerblue;
  width: 200px;
  height: 200px;
  /* float: left; */
}
```

web
![](https://storage.googleapis.com/zenn-user-upload/321a9fdd9983-20220308.png)

横から見たとき
![](https://storage.googleapis.com/zenn-user-upload/7e0ba4551abb-20220308.png)

float で配置場所を変える
浮かせた状態で、プロパティー値を変えることで左右のどちらかに配置することができます。

css

```css
.box1 {
  background-color: azure;
  width: 100px;
  height: 100px;
  float: right;
  /* float: left; */
}
.box2 {
  background-color: aqua;
  width: 150px;
  height: 150px;
  /* float: left; */
}
.box3 {
  background-color: cornflowerblue;
  width: 200px;
  height: 200px;
  /* float: left; */
}
```

web
![](https://storage.googleapis.com/zenn-user-upload/7a13401aae0f-20220308.png)

#### float で横並びにする

各要素ごとに float を用いると横並びにすることができます。

css

```css
.box1 {
  background-color: azure;
  width: 100px;
  height: 100px;
  float: left;
  /* float: right; */
}
.box2 {
  background-color: aqua;
  width: 150px;
  height: 150px;
  float: left;
}
.box3 {
  background-color: cornflowerblue;
  width: 200px;
  height: 200px;
  float: left;
}
```

web
![](https://storage.googleapis.com/zenn-user-upload/1f46a1e065c7-20220308.png)

## clearfix

◆sample/lesson16

前章で float で横並びにする方法を学びました。
ですが、現状のままだと、下記のような表示のさせかたができません。

やりたいこと
web
![](https://storage.googleapis.com/zenn-user-upload/e0a7b3aa249f-20220308.png)

現状のやり方でやると
box1〜3 が float で浮いているので、box4 が隠れてしまします。

html

```html
<!-- １段目 -->
<div class="box1"></div>
<div class="box2"></div>
<div class="box3"></div>
<!-- 2段目 -->
<div class="box4"></div>
```

css

```css
.box1 {
  background-color: azure;
  width: 100px;
  height: 100px;
  float: left;
}
.box2 {
  background-color: aqua;
  width: 100px;
  height: 100px;
  float: left;
}
.box3 {
  background-color: cornflowerblue;
  width: 100px;
  height: 100px;
  float: left;
}
.box4 {
  background-color: tomato;
  width: 500px;
  height: 100px;
}
```

web
![](https://storage.googleapis.com/zenn-user-upload/ccc527453593-20220308.png)

#### clearfix で入り込みを「なし」にする

clearfix は、下側に入り込んでくる要素をせき止めるプロパティです。
「保護フィルター」のような役目をします。
float させた要素の親要素に、clearfix 用の CSS を設定します。

wrap の中に box1〜3 を入れます。
html

```html
<div class="wrap">
  <div class="box1"></div>
  <div class="box2"></div>
  <div class="box3"></div>
</div>
```

css
wrap に擬似要素（after）を用いて、下側に回り込まないようにします。

```css
.wrap::after {
  display: block;
  clear: both;
  content: "";
}
```

web
回り込みを無くし、1 段目と 2 段目ができました。
![](https://storage.googleapis.com/zenn-user-upload/9d92f2bbf6ae-20220308.png)

#### clearfix を解説

疑似要素（::after）（::before）
「疑似要素」は、要素の一部に対してスタイルを適用するセレクタです。
要素内の特定の文字や行に対して、スタイルを指定したり、文字や画像を追加することができます。疑似要素 `::after`は、要素の直後にスタイルや要素を追加します。
逆に、`::before`を付けると、要素の直前に追加されます。

#### content

`content`は、要素の直前または直後にコンテンツを挿入します。""内に挿入したい文字列や画像などを記述します。
今回は、コンテンツを挿入しないため、`""`のみ記述します。
`""`のみ記述することで、`::after`で指定された箇所に空白が挿入されます。

#### display

`display`は、要素の表示方法を切り替えるために使われます。ここでは、ブロック要素に変更し、横幅を 100%にしています。
つまり、空白の領域を横いっぱいに伸ばして、薄い壁を作っています。

#### clear

`clear`は、`float`を解除するためのプロパティです。
右フロートを解除する right、左フロートを解除する left、左右の両方を解除する both があります。
`clear: both;`では、左寄せ・右寄せの両方の float を解除します。
![](https://storage.googleapis.com/zenn-user-upload/ad513ee09b37-20220308.png)

他の書き方を見よう
下記のように表示させたい場合
上にからの要素をつくりたいので、疑似要素は「::before」を使います。

css

```css
/* .wrap::after{
    diaplay: block;
    clear: both;
    content: "";
} */
.wrap::before {
  display: block;
  clear: both;
  content: "";
}
```

web
![](https://storage.googleapis.com/zenn-user-upload/dc97cf7502aa-20220308.png)

## flex

◆sample/lesson0

前章で float を用いて、要素を横並びにする方法をやりました。

しかし、float は、仕組みや使い方が複雑でわかりにくく、記述をどこかで誤ると大きくレイアウトが崩れてしまう。float は高さが消えるため、clearfix による解除が必要。
などの欠点がありました。

従来はこれらの欠点がありましたが、新たな CSS の仕組みがとして、"CSS Flexible Box Layout Module"、略して Flexbox が登場しました。
Flexbox は横並び以外にも色々なレイアウトを可能にしています。

#### Flexbox の基本的な書き方

Flex コンテナーと呼ばれる親要素の中に、Flex アイテムと呼ばれる子要素を入れます。
親要素に「display: flex;」を入れ、flex プロパティを入れることで様々なレイアウトをすることを可能にします。
![](https://storage.googleapis.com/zenn-user-upload/d90f6365e2c6-20220308.png)

html

```html
<div class="flex">
  <div class="box">1</div>
  <div class="box">2</div>
  <div class="box">3</div>
</div>
```

```css
.flex {
  display: flex;
}
```

web
![](https://storage.googleapis.com/zenn-user-upload/c1f128011080-20220308.png)

flex-direction（子要素の並ぶ向き）

![](https://storage.googleapis.com/zenn-user-upload/c1188e7b866c-20220308.png)

![](https://storage.googleapis.com/zenn-user-upload/ca2319c31130-20220308.png)

flex-wrap （子要素の折り返し）
![](https://storage.googleapis.com/zenn-user-upload/02b644687ae0-20220308.png)

justify-content （水平方向の揃え）
![](https://storage.googleapis.com/zenn-user-upload/468f91a8bf7b-20220308.png)

align-items … 垂直方向の揃え
![](https://storage.googleapis.com/zenn-user-upload/26531e4399d2-20220308.png)
