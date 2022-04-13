---
title: "PHP 応用"
---

# 1.PDO を使った DB アクセス

## Web ページの仕組み

ブラウザからサーバに「このファイルを見せてください」と要求（リクエスト）をすると、サーバはリクエストに応じて Web ページの情報を返してきます(レスポンス)。
このリクエストとレスポンスの繰り返しで Web ページを閲覧しています。
リクエストの方法（メソッド）でよく使用するのが GET、POST です。
GET や POST を利用すると、リクエストすると同時にデータ（フォームで入力したデータなど）をサーバに渡すことができます。GET と POST はそれぞれデータの受け取り方に特徴があります。

### GET

- サーバから情報を取得してくる時に使用する
- 見られたくない情報は、GET では送らない
- 送信できるデータ量に制限がある
- ブックマークに保存するページ
  以下のように URL の?よりあとに「名前=値」という形式でデータを付加してリクエストします。
  この ? よりあとの文字を**クエリストリング**といいます。

```
// ユーザー側に見えるURL
https://example.com/index.php/?lang=PHP&name=yamada
```

このように送信するデータが URL で丸見えになってしまうので、見られたくない情報は GET で送らないようにします。

#### PHP 側での受け取り方

`$_GET['名前']`で受け取ります。
データがある場合のみ処理をするため、空白かどうかを確かめる empty()関数を使用しましょう。

先ほどの URL でリクエストした場合の例

```php
<?php
# データがある場合のみ処理
if (!empty($_GET[‘lang’])){
    echo $_GET['lang'];  # PHP
    echo $_GET['name'];  # yamada
}
?>
```

### POST

- サーバへ情報を登録する時に使用する（データベースへの格納など）
- データ量が多い場合
- 他の人に見られたくない情報を送る場合（パスワードなど）

PHP 側での受け取り方
GET を POST に変えるだけです。
`_POST['名前']`で受け取ります。

## PDO でデータベースへの接続

生の PHP でデータベースにアクセスするには、PDO（PHP Data Objects）というものを使うことで可能となります。詳しくは、以下の公式ドキュメントを参照してください。

https://www.php.net/manual/ja/book.pdo.php

## 課題

### $\_GET / $\_POST に関する課題

#### 【PHP_A_1-1】 以下フォームからデータを受け取り、「XX さんは XX 歳です」と表示してください。また、年齢が 120 歳以上ならエラーを表示してください。

### PDO に関する課題

#### 【PHP_A_1-2】 users テーブルのデータを全件出力する

#### 【PHP_A_1-3】 orders テーブルから、ID が一番大きいものを削除する

https://kurogoma939.github.io/backend_php_sample/form.html

:::message
テーブルは、SQL の課題で使ったものを引用してください。
:::
:::message alert
PDO を使うためには、データベースにアクセス可能なユーザー情報が必要です。
以下のサイトを参考にユーザーを追加してください。
ユーザー名：「autumn_tarou」
パスワード:「autumn」
:::
https://www.dbonline.jp/phpmyadmin/user/index1.html

# 2.json ファイルの操作

## JSON とは？

JSON は、JavaScript Object Notation の略です。直訳すると、「JavaScript のオブジェクトの表記法」となります。

> **Ja**va**S**cript：プログラミング言語の 1 つ。JS とも言う
> **O**bject：オブジェクト。
> **N**otation：表記法

### JSON の例

```json
{
  "productId": 1,
  "productName": "backlog",
  "price": 100,
  "tags": ["PHP", "Ruby"]
}
```

## JSON の記述ルール

- {}（波括弧）で囲む
- それぞれのデータは、キー（key）と値（value）のペアにする必要がある
- key と value は:（コロン）で区切る
- それぞれのデータを,（カンマ）で区切る
- 最後のデータにカンマを入れてはいけない
- key は文字列、value は様々なデータ型で記述可能
- 文字列は必ず""（ダブルクオーテーション）で囲む

## 利用可能なデータの種類

利用可能なデータの種類は 6 つあります。

### 文字列

文字列は、必ず""（ダブルクオーテーション）で囲みます。'（シングルクオーテーション）による代用は不可。

#### 例

```json
"これはPHPです。", "https:\/\/hogehuga.com"
```

### 数値

「整数」または「実数」をそのまま表現可能です。

#### 例

```json
1001, 3.14
```

### 真偽値

真偽値は Boolean とも言います。true, false のいずれかの値を取ります。

### 配列

配列は必ず[]（角括弧）で囲みます。
配列内のデータは必ず,（カンマ）で区切り、データはどんな型（文字列、数値、真偽値、配列、オブジェクト、Null 値）のものでも入れることができます。

#### 例

```
["PHP","Ruby","JS"], [PHP言語,"Ruby言語",true, "JS言語"]
```

### オブジェクト

オブジェクトは、{}で囲みます。また、キー（key）と値（value）のペアにする必要があり、それぞれのデータは,（カンマ）で区切ります。
JSON 自体がオブジェクト（JavaScript Object Notation）であり、JSON の記述方法と同様のルールで表現します。

#### 例

```json
{
  "productId": 1,
  "productName": "A green door",
  "price": 12.5,
  "tags": ["home", "green"]
}
```

### Null 値

Null 値は、何もない（空データ）を表します。小文字の null で表記します。

## PHP で JSON を使うには

JSON 読み込みには、以下の関数を使用します。使い方は自分で調べてみてください。

#### file_get_contents

###### 公式

https://www.php.net/manual/ja/function.file-get-contents.php

#### json_decode

##### 公式

https://www.php.net/manual/ja/function.json-decode.php

## 課題

#### 【PHP_A_2-1】 json ファイルを読み込んで各都道府県名（キー名：name）を表示させてください

#### 【PHP_A_2-2】 読み込んだ json を下記の形式の配列にして表示させてください

```json
[
    "都道府県名A" => [市町村名1, 市町村名2...],
    "都道府県名B" => [市町村名3, 市町村名4...],
    ...
]
```

#### 【PHP_A_2-3】 下記の形式に配列にして表示させてください。

```json
[
    "北海道地方" => [
        "県名" => [県名1, ...],
        "市町村名" => [市町村名1, ...],
        ...
    "東北地方" => [
        "県名" => [県名2, ...],
        "市町村名" => [市町村名2, ...],
        ...
        ...
]
```

# 3.ログイン認証機能を実装

ここでの課題は、PDO を活用した問題にチャレンジしましょう。
課題にファイルにある入力フォームを用いたログイン認証を実装してみましょう。
入力値の判別や、エラー処理についても考慮してください。

## 課　題

#### 【PHP_A_3-1】 フォームから送信された ID、パスワードを会員リスト(ID,パスワード,名前)と比較し、ID・パスワードが一致したら名前を、それ以外はエラーメッセージを表示してください。

#### 【課題用フォーム】

今回の課題に使用するフォームを用意しておきました。以下の HTML に PHP 処理を組み込んでください。
:::details php_a_3-1.html

````html:php_a_3-1.html
<!doctype html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login Form</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<main class="form-signin mt-5">
    <div class="card w-50 d-flex align-items-center justify-content-center m-auto p-5" style="border-radius: 50px;">
        <form class="w-75">
            <img class="mb-5 d-block mx-auto" src="../../assets/sample_logo.png" alt="" width="250" height="57">
            <h1 class="h4 mb-3 fw-normal text-center">ログインフォーム</h1>
            <label for="inputEmail" class="visually-hidden">メールアドレス</label>
            <input type="email" id="inputEmail" class="form-control my-5" placeholder="メールアドレス" required autofocus>
            <label for="inputPassword" class="visually-hidden">パスワード</label>
            <input type="password" id="inputPassword" class="form-control my-5" placeholder="パスワード" required>
            <button class="w-100 btn btn-lg btn-primary" type="submit">ログイン</button>
        </form>
    </div>
</main>
</body>
</html>
:::


https://kurogoma939.github.io/backend_php_sample/login.html



# 4.実践問題
それでは、PHP最終問題です。
PHPには色々な組み込み関数があり、やりたいことは大抵関数で実現できます。色々な関数は、公式マニュアルから検索することを推奨します。

## 課題
#### 【PHP_A_4-1】 簡易ポーカーゲーム
:::message
事前にcreate_trumps_table.sql / inset_trumps_table.sqlをインポートまたは実行をし、
テーブルを用意しておいてください。
:::

最終課題では、簡単なポーカーゲームの実装をしていただきます。

#### 〜必須機能〜
>山札（データベース）から、自分と相手に5枚ずつカードを渡す。
>勝負！ボタンを押したら強弱を判別し、勝ったらYou Win、負けたらYou　Loesを表示する。
>勝敗数をカウントし、一番下に表示しておく
>※データベースの設定は個人で行う課題です。
>リセットボタンを押したら勝敗履歴がリセットされる

#### 〜勝敗について〜
>役は、ワンペア、ツーペア、スリーカード、フォーカードで戦う。
>※絵柄については判定しなくて良いです。

なお、サンプルのhtmlを用意したため、ループ処理等を絡めてうまく実装してみてください。

【課題用フォーム】
今回の課題に使用するフォームを用意しておきました。そちらにPHP処理を組み込んでください。
:::details poker.html
```html:poker.html
<!doctype html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ポーカーゲームを実装！</title>
    <!-- MDB -->
    <link
        href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.css"
        rel="stylesheet"
    />
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</head>
<body>
<div class="card text-center w-75 d-flex m-auto mt-3">
    <div class="card-header bg-info fs-4 text-light">ポーカーゲーム</div>
    <div class="card-body">
        <h5 class="card-title">あなたの手札</h5>
        <!-- 手札 -->
        <div class="px-5 py-4 d-flex justify-content-between">
            <div class="card p-3" style="width:8rem; height:12rem;">
                <h4 class="card-title">♡</h4>
                <div style="height:2rem;"></div>
                <h3 class="card-text">10</h3>
            </div>
            <div class="card p-3" style="width:8rem; height:12rem;">
                <h4 class="card-title">♧</h4>
                <div style="height:2rem;"></div>
                <h3 class="card-text">9</h3>
            </div>
            <div class="card p-3" style="width:8rem; height:12rem;">
                <h4 class="card-title">♧</h4>
                <div style="height:2rem;"></div>
                <h3 class="card-text">10</h3>
            </div>
            <div class="card p-3" style="width:8rem; height:12rem;">
                <h4 class="card-title">♢</h4>
                <div style="height:2rem;"></div>
                <h3 class="card-text">A</h3>
            </div>
            <div class="card p-3" style="width:8rem; height:12rem;">
                <h4 class="card-title">♤</h4>
                <div style="height:2rem;"></div>
                <h3 class="card-text">7</h3>
            </div>
        </div>
        <!-- ここまで -->
        <div class="d-flex align-items-center justify-content-between m-auto" style="width:20%;">
            <form method="GET" name="shafful_card" action="">
                <input class="btn btn-warning text-light" type="submit" value="シャッフル">
            </form>
            <form method="POST" name="judge_game" action="">
                <input class="btn btn-primary" type="submit" value="勝負！">
            </form>
        </div>
        <p class="fs-10 pt-3">勝敗結果</p>
        <p class="fs-3 text-danger pb-3">
            You Win !!
        </p>
        <p class="card-text">
        <p>【　役による序列　】：ワンペア &lt; ツーペア &lt; スリーカード &lt; フォーカード &lt; ファイブカード</p>
        <p class="pt-3">【　マークによる序列　】：クラブ &lt; ダイヤ &lt; ハート &lt; スペード</p>
    </div>
    <div class="card-footer text-muted d-flex justify-content-between align-items-center bg-light">
        <div class="d-flex">
            <div class="mx-3">勝った回数：10回</div>
            <div class="mx-3">負けた回数：4回</div>
        </div>
        <div>
            <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#confirmModal">
                リセット
            </button>
            <!-- Modal -->
            <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="confirmModalLabel">勝敗履歴のリセット</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <pre style="white-space: pre-line; font-size:16px;">
                                勝敗履歴をリセットします。
                                よろしいですか？
                            </pre>
                            <div class="w-50 m-auto d-flex align-items-center justify-content-between">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">前に戻る</button>
                                <button type="button" class="btn btn-danger">リセット</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
````

:::

![poker.html](https://storage.googleapis.com/zenn-user-upload/c966d427502e-20220308.png)

https://kurogoma939.github.io/backend_php_sample/poker.html

:::details 課題用 sql

```sql:create_trumps_table.sql
CREATE TABLE `trumps` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `mark` varchar(10) NOT NULL,
    `number` int(10) NOT NULL,
    `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `create_timestamp` (`create_timestamp`),
    KEY `update_timestamp` (`update_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='トランプテーブル';
```

```sql:insert_trunps_table.sql
INSERT INTO trumps(id, mark, number)
VALUES (1,'spade',1),
       (2,'spade',2),
       (3,'spade',3),
       (4,'spade',4),
       (5,'spade',5),
       (6,'spade',6),
       (7,'spade',7),
       (8,'spade',8),
       (9,'spade',9),
       (10,'spade',10),
       (11,'spade',11),
       (12,'spade',12),
       (13,'spade',13),
       (14,'heart',1),
       (15,'heart',2),
       (16,'heart',3),
       (17,'heart',4),
       (18,'heart',5),
       (19,'heart',6),
       (20,'heart',7),
       (21,'heart',8),
       (22,'heart',9),
       (23,'heart',10),
       (24,'heart',11),
       (25,'heart',12),
       (26,'heart',13),
       (27,'diamond',1),
       (28,'diamond',2),
       (29,'diamond',3),
       (30,'diamond',4),
       (31,'diamond',5),
       (32,'diamond',6),
       (33,'diamond',7),
       (34,'diamond',8),
       (35,'diamond',9),
       (36,'diamond',10),
       (37,'diamond',11),
       (38,'diamond',12),
       (39,'diamond',13),
       (40,'club',1),
       (41,'club',2),
       (42,'club',3),
       (43,'club',4),
       (44,'club',5),
       (45,'club',6),
       (46,'club',7),
       (47,'club',8),
       (48,'club',9),
       (49,'club',10),
       (50,'club',11),
       (51,'club',12),
       (52,'club',13);
```

:::
