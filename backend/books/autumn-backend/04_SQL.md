---
title: "SQL"
---

# 環境構築

SQL とは、アプリケーションのデータを管理するデータベース及びデータベースで管理されているテーブルに対して操作をすることができる言語になります。
フレームワークやライブラリを用いれば PHP のような言語でもデータベースの操作は可能になります。
SQL を実行するためには、データベースがある環境を整えなくてはならないため、準備をしましょう。

## MAMP のインストール

MAMP は、PHP とデータベースの環境を整えてくれるアプリケーションです。
以下のリンクから、今回使用する MAMP をインストールしてください。
※自身の PC に合うバージョンを選択してください。
https://www.mamp.info/en/downloads/

## MAMP の起動

アプリケーションを起動すると、以下のようなウィンドウが表示されます。

> ① ウィンドウ右上の Start ボタンを押下（スクショの Stop ボタンの部分）
> ② アプリが立ち上がったら WebStart ボタンを押下
> ![MAMP起動](https://storage.googleapis.com/zenn-user-upload/e0ea330a62e8-20220307.png)

## phpMyAdmin の起動

WebStart ボタンを押下するとブラウザで以下のようなページが立ち上がります。
ヘッダーの**Tools** => **phpMyAdmin**を押下してください。
![phpMyAdminの起動](https://storage.googleapis.com/zenn-user-upload/feec6bcdbbbe-20220307.png)

## データベースの作成

> ① 左のサイドバーの**New**ボタンを押下する
> ② データベース名に **「autumn_db」** と入力
> ③ **「Create」** を押下して完了
> ![データベース作成](https://storage.googleapis.com/zenn-user-upload/e9c94bcb5e35-20220307.png)

## SQL の実行方法 ① インポート

SQL の実行方法は 2 つあります。
1 つ目は、.sql の拡張子を持つファイルをインポートすること。
2 つ目は、SQL 文を直接 MAMP 上で実行することです。
まずは、1 つ目の SQL ファイルのインポートをする手順についてです。

> ① 「import タブ」を選択
> ② 「ファイルを選択」を押下し、読み込ませたい SQL ファイルを選択する
> ③ 「Go」を押下して実行
> ![SQLインポート](https://storage.googleapis.com/zenn-user-upload/7394fac0e0fa-20220307.png)

## SQL の実行方法 ② 直接実行

次に、直接 MAMP 上に SQL 文を書いて実行する方法です。

> ① 「SQL タブ」を選択
> ② テキストエリアに SQL 文を書く
> ③ 「Go」を押下して実行
> ![](https://storage.googleapis.com/zenn-user-upload/0cf51d79505b-20220307.png)

## カリキュラム用データ作成

それでは、課題に必要な以下の SQL をそれぞれ MAMP で実行、もしくはインポートしてください。
※極力以下の並び順で実行してください。
※import する SQL ファイルは GitHub 上にあります。

:::details roles テーブル

```sql:create_roles_table.sql
CREATE TABLE `roles` (
     `id` int(11) NOT NULL AUTO_INCREMENT,
     `name` varchar(255) NOT NULL Unique,
     `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
     `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     PRIMARY KEY (`id`),
     KEY `create_timestamp` (`create_timestamp`),
     KEY `update_timestamp` (`update_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='権限管理テーブル';
```

```sql:insert_roles_table.sql
INSERT INTO roles(id, name)
VALUES (1,'一般ユーザー'),
       (2,'管理者');
```

:::

:::details users テーブル

```sql:create_users_table.sql
CREATE TABLE `users` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL Unique,
    `email` VarChar(255) NOT NULL Unique,
    `password` varchar(255) NOT NULL,
    `gender` varchar(10) NOT NULL,
    `role_id` int(11) NOT NULL,
    `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `create_timestamp` (`create_timestamp`),
    KEY `update_timestamp` (`update_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='user管理テーブル';
```

```sql:insert_users_table.sql
INSERT INTO users(id, name, email, password, gender,role_id)
VALUES (1,'John', 'john@gmail.com', 'Johndesu', 'M', 1),
       (2,'Kevin', 'kevin@gmail.com', 'kevindesu', 'F', 1),
       (3,'Kanta', 'kanta@gmail.com', 'kantadesu', 'M', 1),
       (4,'Mei', 'mei@gmail.com', 'meidesu', 'F', 1),
       (5,'master', 'master@gmail.com', 'masteradmin', 'F', 2);
```

:::

:::details items テーブル

```sql:create_items_table.sql
CREATE TABLE `items` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL Unique,
    `price` int(30) NOT NULL,
    `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `create_timestamp` (`create_timestamp`),
    KEY `update_timestamp` (`update_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='商品管理テーブル';
```

```sql:insert_items_table.sql
INSERT INTO items(id, name, price)
VALUES (1,'オレンジジュース1000ml', 200),
       (2,'ボールペン(black)', 230),
       (3,'B5お絵かき帳', 150),
       (4,'収納ケース', 500),
       (5,'ボックスティッシュ', 180),
       (6,'ITパスポートテキスト', 1200),
       (7,'電子メモ帳', 2200),
       (8,'type-c充電ケーブル', 800),
       (9,'iPhoneケース', 2700),
       (10,'レトルトカレー', 290);
```

:::

:::details orders テーブル

```sql:create_orders_table.sql
CREATE TABLE `orders` (
     `id` int(11) NOT NULL AUTO_INCREMENT,
     `item_id` int(11) NOT NULL,
     `count` int(10) NOT NULL,
     `total_price` int(100),
     `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
     `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     PRIMARY KEY (`id`),
     KEY `create_timestamp` (`create_timestamp`),
     KEY `update_timestamp` (`update_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='発注管理テーブル';
```

```sql:insert_orders_table.sql
INSERT INTO orders(id, item_id, count)
VALUES (1,1,9),
       (2,5,8),
       (3,3,7),
       (4,2,5),
       (5,7,8),
       (6,8,10),
       (7,1,20),
       (8,9,9),
       (9,4,11),
       (10,10,20);
```

:::

:::details customers テーブル

```sql:create_customers_table.sql
CREATE TABLE `customers` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL Unique,
    `email` varChar(255) NOT NULL Unique,
    `gender` varchar(255),
    `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `create_timestamp` (`create_timestamp`),
    KEY `update_timestamp` (`update_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='顧客テーブル';
```

```sql:insert_customers_table.sql
INSERT INTO customers(id, name, email, gender)
VALUES (1,'John', 'john@gmail.com', '男'),
       (2,'Kevin', 'kevin@gmail.com', '女'),
       (3,'Mika', 'mika@gmail.com', '男'),
       (4,'Joseph', 'joseph@gmail.com', '女'),
       (5,'Rena', 'rena@gmail.com', '男');
```

:::

:::details purchases テーブル

```sql:create_purchases_table.sql
CREATE TABLE `purchases` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `item1` varchar(255),
    `item2` varchar(255),
    `item3` varchar(255),
    `total` int(255),
    `customer_id` int(11) NOT NULL,
    `create_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `create_timestamp` (`create_timestamp`),
    KEY `update_timestamp` (`update_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='購入管理テーブル';
```

```sql:insert_purchases_table.sql
INSERT INTO purchases(id, item1, item2, item3, total, customer_id)
VALUES (1,'雑貨', '化粧品', '食器', 10000, 1),
        (2, '野菜', '家電', '食器', 5000, 2),
        (3,'雑貨', '家電', '洋服', 20000, 1),
        (4,'DIY', '家電', '化粧品', 10000, 3),
        (5,'雑貨', '野菜', '食器', 20000, 2),
        (6,'化粧品', '家電', 'DIY', 10000, 1),
        (7,'化粧品', '家電', '野菜', 5000, 5),
        (8,'雑貨', '洋服', '食器', 10000, 2),
        (9,'DIY', '化粧品', '食器', 3000, 3),
        (10,'DIY', '家電', '食器', 3000, 4),
        (11,'雑貨', 'DIY', 'DIY', 10000, 2),
        (12,'雑貨', '家電', '食化粧品器', 3000, 1),
        (13,'雑貨', '家電', '野菜', 10000, 1),
        (14,'化粧品', 'DIY', '食器', 5000, 2),
        (15,'野菜', '家電', '化粧品', 20000, 4),
        (16,'雑貨', '野菜', '食器', 3000, 3),
        (17,'DIY', '化粧品', '食器', 10000, 2),
        (18,'雑貨', '化粧品', '食器', 20000, 1),
        (19,'雑貨', '家電', '洋服', 5000, 5),
        (20,'化粧品', '洋服', '食器', 20000, 2),
        (21,'洋服', '家電', '食器', 5000, 3),
        (22,'化粧品', '家電', '野菜', 3000, 3),
        (23,'DIY', '家電', '化粧品', 10000, 3),
        (24,'雑貨', '野菜', '食器', 20000, 2),
        (25,'化粧品', '家電', 'DIY', 10000, 1),
        (26,'化粧品', '家電', '野菜', 5000, 5),
        (27,'雑貨', '洋服', '食器', 10000, 2),
        (28,'DIY', '化粧品', '食器', 3000, 3),
        (29,'DIY', '家電', '食器', 3000, 4),
        (30,'雑貨', 'DIY', 'DIY', 10000, 2),
        (31,'雑貨', '家電', '食化粧品器', 3000, 1),
        (32,'雑貨', '家電', '野菜', 10000, 1),
        (33,'化粧品', 'DIY', '食器', 5000, 2),
        (34,'野菜', '家電', '化粧品', 20000, 4),
        (35,'雑貨', '野菜', '食器', 3000, 3),
        (36,'DIY', '化粧品', '食器', 10000, 2),
        (37,'雑貨', '化粧品', '食器', 20000, 1),
        (38,'雑貨', '家電', '洋服', 5000, 5),
        (39, '野菜', '家電', '食器', 5000, 2),
        (40,'雑貨', '家電', '洋服', 20000, 1);
```

:::

# SQL の基礎知識

### MySQL で利用することができるデータ型と利用方法

https://www.dbonline.jp/mysql/type/

### データベースの作成

https://www.dbonline.jp/mysql/database/

### テーブルの作成

https://www.dbonline.jp/mysql/table/

### データの取得

https://www.dbonline.jp/mysql/select/

## PHP から Mysql への接続

PHP から Mysql へ接続し、情報を取り出すには、PDO を使用します。
PDO とは、PHP Data Objects の略称で、一言で言い表すならば、PHP からデータベースのアクセスを可能にしてくれるものです。

### MySQL へ接続

https://www.javadrive.jp/php/pdo/index3.html
http://html2php.starrypages.net/php/pdo

# 課題１　一覧表示

まずは、データを表示する基本の処理をやってみましょう。

#### 【SQL_1-1】 データベースにあるテーブル一覧を表示してみましょう。

#### 【SQL_1-2】 users テーブルと、orders テーブルのデータ一覧を表示してみましょう。

※課題は、.sql ファイルに記述して GitHub で提出してください。

# 課題２　条件検索

課題１で表示させる処理をやってみましたが、課題２では、条件に合致する件数だけを出力する処理をやってみましょう。
また、データが何件あるかを調べる処理も実装してみましょう。

#### 【SQL_2-1】 items テーブルから、単価が 500 円以上の商品を抽出してください。

#### 【SQL_2-2】 orders テーブルから、10 個以上発注されている商品を抽出してください。

#### 【SQL_2-3】 上記 SQL_2-2 の課題の条件で出力される件数を取得してください。

#### 【SQL_2-4】 purchases テーブルから曖昧検索で特定の文字列を含むレコードを取得してみましょう。
　※列名はご自身で指定して頂いて構いません。

#### 【SQL_2-5】 itemsテーブル、ordersテーブルからどちらかにしかないデータを抽出してください。
※OUTER JOINは使用しないものとします。

# 課題３　テーブル結合

データベースのテーブルは、１テーブルにつき１つの属性情報を管理するようにしましょう。
例えば、users テーブルにある role_id について解説します。

users テーブルは、「ユーザーに関する情報」を管理するために存在します。しかし、「権限の種類」はユーザーテーブルに管理をさせると
権限別のリストの取得や、権限名の変更などが難しい状態になってしまうのでメンテナンス性（保守性）が低下してしまいます。

そのため、権限に関するデータは別の roles テーブルに管理させています。
また、users テーブルは roles テーブルから権限情報を取得するのですが、それには「テーブルの結合」をさせる必要があります。
テーブルを結合させることで、関連するデータをまとめて取得・整理することが可能となります。
では、課題に取り組んでみましょう。
![join_sql](https://storage.googleapis.com/zenn-user-upload/2a97cfa149ac-20220307.png)

#### 【SQL_3-1】 users テーブルと roles テーブルを結合して出力してください

#### 【SQL_3-2】 items テーブルと orders テーブルを結合して出力してください

# 課題４　 CRUD 処理

## CRUD 処理

様々なアプリケーションの基本機能として Create（登録）,Read（読み込み）,Update（更新）,Delete（削除） を総称した CRUD というものが一般的な機能となっています。ちなみに、手前で行ったのは CRUD のうちの Read に当たります。

## 外部テーブルの参照

前の課題で実施してもらいましたが、テーブルの結合が必要な課題となります。 今回使うテーブルは、items テーブルと orders テーブルです。【SQL_3-2】をやれば、この２つのテーブルは item_id で結合されていることがわかると思います。

### 結合前のテーブル

![sql1](https://storage.googleapis.com/zenn-user-upload/b39c99578bee-20220307.png)

### 結合後のテーブル

![sql2](https://storage.googleapis.com/zenn-user-upload/19ff6ade94c7-20220307.png)
orders テーブルにある total_price は、items テーブルの price と orders テーブルの count を掛け算する必要があります。少し難しい内容ですが、チャレンジしてみてください！

#### 【SQL_4-1】 orders テーブルにレコードを追加してください。

※total_price はクエリ内で計算して算出してください。

#### 【SQL_4-2】 orders テーブルの id=2 のレコードを更新してください。

※total_price はクエリ内で計算して算出してください。

#### 【SQL_4-3】 items テーブルから、id=1 のレコードを削除してください。

※削除の際、orders テーブルからも削除される状態にしてください。

# 課題５　実践問題

いよいよ SQL 最後の課題です！今までの復習なので頑張りましょう！

#### 【SQL_5-1】purchases テーブル / customers テーブルから、以下の条件を満たすクエリを記述して下さい。

＜ 条 件 ＞

> ① テーブルを結合し、total_price の昇順、性別の降順で一覧を表示してください。
> ※男：M、女：F
> ② 化粧品を購入し、かつ合計 10,000 円以上購入をしたユーザーを取得してください。
> ③ 合計金額が 5000 円未満のユーザーを全て削除してください。
