---
title: "プログラミングを体験してみよう！"
---

# おすすめ居酒屋を取得するプログラム

バックエンドカリキュラムでは、主に SQL、PHP、Laravel を中心に学習を進めていきます！
まずは、少しでもプログラミングの楽しさを知ってもらうために、以下のプログラムを実行してみましょう！

## 1.事前準備

### API キーの作成

API という言葉、聞いたことある方もいると思います。
API とは、簡単にいうと「サーバーエンドだけのアプリ」と捉えていただければ良いです。
今回は、「食べログ」ランキングを管理している API に対してリクエストを送り、その結果を受け取ります。
API 通信には、API キーと言う「使用許可証」のようなものが必要です。
まずは以下のリンクにアクセスし、API キーの発行をしてください。
https://webservice.recruit.co.jp/register/
:::message
あとで使うので控えておいてください。
:::

### 作業フォルダの作成

#### Windows の場合

```
$ cd Desktop
$ mkdir php_training && cd php_training
$ touch restaurant_search.php
```

#### Mac の場合

```
$ mkdir php_training && cd php_training
$ touch restaurant_search.php
```

### パッケージ等のインストール

#### ① PHP を実行する composer が入っているか確認

```
composer -v

// 以下が出れば成功
   ______
  / ____/___  ____ ___  ____  ____  ________  _____
 / /   / __ \/ __ `__ \/ __ \/ __ \/ ___/ _ \/ ___/
/ /___/ /_/ / / / / / / /_/ / /_/ (__  )  __/ /
\____/\____/_/ /_/ /_/ .___/\____/____/\___/_/
                    /_/
Composer version 2.2.6 2022-02-04 17:00:38
```

#### ② なければインストール

Mac の場合

```
brew install composer
```

Windows の場合 <br>
https://mebee.info/2020/04/17/post-9628/

#### ③ 確認

```
composer -v
```

※ ① のようにバージョンが出れば良い

#### ④ Guzzle インストール

```
composer require guzzlehttp/guzzle
```

## 2.コードを書く

以下が今回のアプリケーションのプログラムです。
やじるしを書いてある部分は個人でカスタムをしてください。
:::details restaurant_search.php のコード

```php:restaurant_search.php
<?php
require 'vendor/autoload.php';

use GuzzleHttp\Client;

# 初期設定
$KEYID = "4560500d042071cf"; // ⬅︎発行したAPIキーを入力
$HIT_PER_PAGE = 50; // ⬅︎何件取得したいか（MAX100件まで）
$PREF = "Z011"; // 東京都を設定してあります
$FREEWORD = "港区赤坂"; // ⬅︎調べたいエリアのキーワード
$FORMAT = "json";

$PARAMS = ["key"=> $KEYID, "count"=>$HIT_PER_PAGE, "pref"=>$PREF, "keyword"=>$FREEWORD, "format"=>$FORMAT];

function write_data_to_csv($params){

    $restaurants = [["名称","営業日","住所","アクセス"]];
    $client = new Client();
     try{
        $json_res = $client->request('GET', "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/", ['query' => $params])->getBody();
    }catch(Exception $e){
        return print("エラーが発生しました。APIのURLを確認してください。");
    }
    $response = json_decode($json_res,true);

    if(isset($response["results"]["error"])){
         return(print("エラーが発生しました。APIのパラメータを確認してください。"));
    }

    foreach($response["results"]["shop"] as $restaurant){
             $rest_info = [$restaurant["name"],$restaurant["open"],$restaurant["address"],$restaurant["access"]];
         $restaurants[] = $rest_info
    }
    $handle = fopen("restaurants_list.csv", "wb");
    foreach ($restaurants as $values){
         fputcsv($handle, $values);
    }
    fclose($handle);
    return print_r($restaurants)
}

write_data_to_csv($PARAMS);

?>
```

:::

## 3.動作確認

PHP を実行するには、`php ファイル名`で実行することができます。
以下のコマンドをターミナル/コマンドプロンプトで実行して確認してみましょう。

```
$ php restaurant_search.php
```

### 出力結果

ターミナル/コマンドプロンプト上に以下のように出力され、CSV ファイルも出力されれば成功です。

```
Array
(
     [0] => 赤から 渋谷宮益坂店
     [1] => やきとりセンター 渋谷センター街店
     [2] => 渋谷ベルゴ
     [3] => 博多 もつ楽 渋谷店
     [4] => 渋谷 個室居酒屋 黄金屋
     [5] => ぶっちぎり酒場 渋谷スペイン坂店
     [6] => 真巴石‐シンバセイ‐ 薬膳火鍋 しゃぶしゃぶ 渋谷店
     [7] => biodinamico（ビオディナミコ）
      ...件数分出力
```

## 4.もう少し拘りたい方へ

出力された CSV ファイルを使い、Google マイマップを作成することができます！
以下の公式サイトを確認してみてください。
やり方がわからなければ質問をしてください！
https://www.google.com/intl/ja_ALL/earth/outreach/learn/visualize-your-data-on-a-custom-map-using-google-my-maps/
