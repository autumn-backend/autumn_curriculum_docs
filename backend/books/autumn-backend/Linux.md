

---
title: "LinuxOS"
---

#### この章ではLinuxコマンドの基礎を学んで行きます

LinuxはWindowsやMacなどと同じOSで、コンピューターのすべてのハードウェアを管理しているソフトウェアのことです。
Linuxはリーナス・トーバルズ氏によって開発され、1991年に最初のバージョンが公開されました。
パソコン用に作られたOSでしたが、いまではスーパーコンピュータ、サーバー、組み込みシステム（携帯電話やテレビなど）など、
様々なシステムで使われています！

#### 練習してみよう！

実際に手を動かしてLinuxコマンドを使用してみましょう！
なお、Windowsに関してはLinuxコマンドを使用できるようにするための設定がありますので
作業端末がWindowsの方はまず環境構築をお願い致します！

〜Windows用のLinux環境構築用ページのリンク？〜

- [ ]  ① ディレクトリ[作業フォルダ]の移動(cdコマンド)
デスクトップに移動します

```
cd Desktop
```
Macターミナルの画像
Linux_1.png
Windowsコマンドプロンプト
画像
存在しないディレクトリに移動しようとした場合のエラー文
Macターミナル
Linux_2.png
Linux_3.png
Windows
画像
(チェックボックス)
- [ ]  ② ディレクトリ[作業用フォルダ]作成(mkdirコマンド)
linux_curriculumと言う名前のフォルダ作成します！
何も出力されていませんが作成されています！
```
mkdir linux_curriculum
```
Macターミナル
Linux_4.png

Windowsコマンドプロンプト
画像
コマンドをスペルミスしてしまった場合のエラー文
Macターミナル
Linux_5.png
Linux_6.png
#### mkdir -> mkbir dがbになってしまっているため、そんなコマンド無いよ！！って怒られています。
Windowsコマンドプロンプト
画像

- [ ] ③ ディレクトリの移動(cdコマンド)
②で作成したフォルダに移動します！（①の作業と同様）
```
cd linux_curriculum
```

- [ ] ④ ファイルの作成(touchコマンド)
何も出力されていませんが作成されています！
```
touch test.html
```
Macターミナル
Linux_7.png
Windowsコマンドプロンプト
画像

- [ ] ⑤ ファイルの存在確認
作成したファイルが存在しているかを確認します！
```
ls
```
Macターミナル
Linux_8.png
Windowsコマンドプロンプト
画像

- [ ] ⑥現在作業しているディレクトリのパス[フォルダの場所]を確認
pwd

Macターミナル
Linux_9.png
Windowsコマンドプロンプト
画像

- [ ] ⑦ 出力クリア(clearコマンド)
出力内容が増えてきたので一旦綺麗にします！

clear

Macターミナル
Linux_10.png
Windowsコマンドプロンプト
画像

- [ ] ⑧ ファイルの編集(viコマンド)
```
vi test.html
```
続いてiキーを押し、insertモード(文字列入力モード)にします！
Macターミナル
Linux_11.png
Windowsコマンドプロンプト
画像
下記コードを追加してください
```
<h1>こちらはLinuxのテストファイルです<h1>
```
Macターミナル
Linux_12.png
Windowsコマンドプロンプト
画像
左上にあるescキー + : キー + wキー + qキーで保存しinsertモードを終了します！
※同時押しではありません
キーの画像
Macターミナル
Linux_13.png
Windowsコマンドプロンプト
画像
⑨ ファイルの中身を確認(catコマンド)
ファイルの記載を確認できるコマンドです！
```
cat test.html
```
⑩ ファイル、またはフォルダ検索(findコマンド)
ファイル、またはフォルダを場所を探すコマンドです！
```
// フォルダ検索
find . -type d -name "*curriculum" 
// *末尾にある「curriculum」に後方一致と言う意味になります。

// ファイル検索
find . -type f -name "*.html" 

// 指定の文字列を含むファイルの検索
find . -type f -name "*.html" | xargs grep -rn "Linuxのテスト"
```

お疲れさまでした！以上でLinuxコマンドの練習課題は終了になります！
今後もぜひ活用しながらカリキュラムを進めていってください！
