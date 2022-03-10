---
title: "Webサイト制作"
---

# 1. Web サイト制作

## レスポンシブサイト制作をしよう

### レスポンシブサイトとは

ウェブサイトを閲覧することができるのは PC だけではありません。スマートフォン、iPod、ウォークマン、スマートグラス、タブレットなど様々です。
特に PC とスマホからの閲覧数が群を抜いて多いわけですが、果たして PC で見せている画面をそのままスマホユーザーに見せたらどうなるでしょうか？
スマホユーザーに PC 用に構築された HTML を見せても横幅のピクセル数が 3 倍以上も違うため、とても見辛い状態です。そこで登場するのがレスポンシブという考えです。
ユーザーがスマホからアクセスした場合、スマホ用の CSS もしくは画面に切り替えてあげることでスマホユーザーでもストレスなくサイトの閲覧をすることができます。

では、どうやってスマホからアクセスがあったと認識できるかというと、
メディアクエリというものを活用します。
メディアクエリとは、ブラウザの横幅がどれくらいかを取得してくれる便利なものです。
実際に、CSS で書いてみると以下のようになります。

```css
/*
@media以外の所は全てのサイズで読み込まれます。
*/
p {
  color: red;
}
@media screen and (min-width: 480px) {
  /*　画面サイズが480pxからはここを読み込む　*/
  p {
    color: #ededed;
  }
}
@media screen and (min-width: 768px) and (max-width: 1024px) {
  /*　画面サイズが768pxから1024pxまではここを読み込む　*/
  p {
  }
}
@media screen and (min-width: 1024px) {
  /*　画面サイズが1024pxからはここを読み込む　*/
}
```

上記のように、〜以上を指定したい場合`min-width`で下限の設定をし、
〜以下を指定したい場合は`max-width`で指定をします。
また、いっそ画面幅ごとファイルを変えたいという場合は、以下のようにすれば切り替えることが可能です。

```css
<link rel="stylesheet" href="small.css" media="screen and (max-width:480px)">/*　画面サイズが480pxまでこのファイルのスタイルが適用される。*/
<link rel="stylesheet" href="medium.css" media="screen and (min-width:480px) and (max-width:1024px)"> /* 画面サイズ480pxから1024pxまではこのファイルのスタイルが適用される。 */
<link rel="stylesheet" href="wide.css" media="screen and (min-width:1024px)">/* 画面サイズ1024px以上はこのファイルはスタイルが適用される */
```

また、所々指定されている`1240`や`480`という数字は**ブレイクポイント**と言います。
昨今はタブレットの普及も進んでいることから、最低３つは設定することが多いようです。

ブレイクポイントの統計については、以下のサイトに時代ごとの画面幅シェア率が掲載されているため、開発の段階になったら参考にしてみてください。
https://lab.syncer.jp/Statistic/Screen-Size/

一応、平均的な値は以下の通りです。

> スマートフォン：320px〜540px
> タブレット：600px〜1024px
> PC：1,280px〜

## 課題

それでは早速、レスポンシブ対応したウェブサイトのコーディングをしてみましょう。
サンプルにあるサイトを参考にコーディングをしてみてください。
なお、ブレイクポイントは 600px で設定してください。
（600px 以上 => PC 用、600px 未満 => SP 用）

#### 【Web_1-1】 サンプルと同じレスポンシブサイトをコーディングしてください。

### サンプル

以下にリンクとキャプチャを載せてあります。
https://kurogoma939.github.io/responsive-sample/

#### PC 用

![](https://storage.googleapis.com/zenn-user-upload/1bf4b463008d-20220308.png)

#### SP 用

![](https://storage.googleapis.com/zenn-user-upload/04e46b5b90c6-20220308.png)

# 2.Sass の学習

次に、CSS の上位互換とも言える Sass という言語にチャレンジしていきましょう！
Sass は、CSS の煩わしさを解消した言語のため、書き方は CSS に近いです。

詳しい説明等は、以下のサイトが参考になるのでこちらを見てから課題に取り組んでみましょう。

https://udemy.benesse.co.jp/design/web-design/sass.html
https://www.fenet.jp/dotnet/column/tool/5245/

万が一、もうちょっと学習してから取り組みたい！という方に向けて以下のサイトもお勧めします。
無料で色々な言語を学習することができます。
https://ninjacode.work/course/SASS

なお、今回のカリキュラムでは**SCSS 記法（ネストする書き方）** に統一をしてください。

## 環境構築

### 1.gulp のインストール

gulp というタスクランナーをインストールし、簡単に Sass 環境を構築します。

```
$ npm install gulp --save-dev
```

### 2.gulpsass のインストール

```
$ npm install gulp-sass --save-dev
```

### 3.gulpfile.js の作成

```JavaScript:gulpfile.js
$ touch gulpfile.js
```

### 4.gulpfile.js の編集

```JavaScript:gulpfile.js
var gulp = require('gulp');
var sass = require('gulp-sass');

gulp.task('sass', function() {
  return gulp
    .src('./sass/**/*.scss')
    .pipe(sass({outputStyle: 'expanded'}))
    .pipe(gulp.dest('./css'));
});
```

## 課題

#### 【Web_2-1】 1-1 でコーディングしたサイトを、そのまま Scss 変換してください。

出力結果が同じであれば成功です。
