---
title: "Windows用　ubuntuとpower shellのインストール"
---

### OSのインストール編
今回はubuntu、powershellのインストールを行っていきます。
windowsにはデフォルトで搭載されているwindows powershellが存在しますが、今回はすべて最新バージョンで環境を整えていきたいので、
別でインストールしていきます。

ubuntu(ウブントゥ)とは
[誰にでも使いやすいOS]をコンセプトとして開発されたLinux系のOSです。
Linux系とはLinuxベースにつくられたOSで、Linuxディストリビュージョンを指します。

#### ディストリビュージョン

カスタマイズしたものを外部に公開することも可能で、用途に合わせてアプリケーション(ソフトウェア)
をパッケージ化したものが多くそんざいしています。これをディストリビュージョンと呼びます！

今回はその中でも特に人気のubuntuのインストールを行います。]

#### １powershellのインストール
　　　　※インストール済みの方は飛ばしてください
        コマンドプロンプトを開きます

        画像貼り付け(木村もってます)
        powershell_1.png
        powershell_2.png

#### 2下記コマンドを入力し、最新バージョンを検索します。
```
　winget search Microsoft.PowerShell　
```

powershell_3.png

 3 Y(yes)を入力が必要な場合はYを入力し、画像のように出力されたらコマンドが実行できています。
 
powershell_4.png
#### 4 続いて書きコマンドを入力します。
```
winget install --id Microsoft.Powershell.Preview --source winget
```
powershell_5.png

実行後下記のように出力されます
変更を加えますか？が表示された場合は(はい)を選択
完了後は画像のように出力されます！

powershell_6.png
続いてWSLのインストールを行っていきます。
一旦コマンドプロンプトを閉じます。

先ほどインストールしたpowershellを開いてみましょう。
1番の作業同様にスタートボタンをクリックし下記で検索してみます。

```
powerShell 7-preview (x64)
```
下記がインストールされていますので[管理者として実行]で開いてみましょう
右クリックで選択できます。
「変更を加えます」が表示された場合は(はい)を選択してください

powershell_7.png
下記画像の赤枠のようになっていない場合は開きなおしてください。
powershell_8.png
下記コマンドを実行し、これでインストール可能なLinuxディストリビューションの一覧が表示されます。
```
 wsl --list --online
```
powershell_9.png
赤枠の部分(*)アスタリスクがついている行の部分がインストールされます。
powershell_10.png
下記コマンドを実行します。
```
wsl --install
```
powershell_11.png
powershell_12.png
powershell_13.png
PCを再起動します。

##ubuntuの初期設定
#### ユーザー名の設定
デフォルトではユーザー名はrootになっています
powershell_14.png

#### パスワードの設定
使用したいパスワードを設定しましょう。パスワードは確認を含めて2回入力する必要があります。
powershell_15.png

なお、ここで作成したユーザは
デフォルトのユーザ ・・・ スタートメニューからLinux環境を起動したときに自動的にログインするユーザ
Linux環境の管理者 ・・・ sudoグループのメンバー
となります。
ユーザの作成に成功すると次のようにbashのプロンプトとなります。

powershell_16.png

下記コマンドを実行してみましょう(右クリックでペーストできます。
```
 cat /etc/lsb-release
```
powershell_17.png

```
cat /proc/version
```
powershell_18.png

HDDを確認すると、Cドライブは/mntの下にマウントされてます。
このためWSL2側からWindows上のファイルに簡単にアクセスすることができます。
```
 df -h
```
powershell_19.png

CPUを確認して見ると使用しているCPUがそのまま見えています。
```
  cat /proc/cpuinfo
```
powershell_20.png

終了の際は下記のコマンドでウィンドウが閉じます
```
 exit
```
バックグラウンドで何も動かしてなければこれでOKみたいなのですが、念のためPower shellでWSLの状態を確認してみましょう。
```
wsl -l -v
```
powershell_21.png

「Stopped」ではなく「Running」であった場合は、Ubuntuはまだ生きています。
その場合は、次のコマンドで終了させることができます。
「-t」のあとに指定する名前は、「wsl –l -v」でNAMEの列に表示されるものを指定します。
```
 wsl -t Ubuntu
```
Linuxをインストールしたあとはパッケージの状態を最新に更新します。
まず、デフォルトの利用レポジトリを確認しておきましょう。
```
 grep ^deb /etc/apt/sources.list
```

powershell_22.png

デフォルトでは「archive.ubuntu.com」と「security.ubuntu.com」に接続しに行きますが、
これらのサーバはイギリスに存在しているようです。
地球を半周しては速度が出ませんので日本のサーバ(jp.archive.ubuntu.com)に替えておきましょう。
```
 sudo sed -i -e 's/http:\/\/archive.ubuntu.com/http:\/\/jp.archive.ubuntu.com/g' /etc/apt/sources.list

```
※ここでパスワードの入力を要求されたら、セットアップ時に設定したパスワードを入力します。

あとはパッケージ一覧のデータベースを更新します。
```
 sudo apt-get update
```
powershell_23.png

```
 sudo apt-get upgrade
```
powershell_24.png

画像の場合は239個のパッケージに更新があるようです。問題がなければ「Y」を入力します。

最後までいったら、もうダウンロードしたパッケージは不要なので削除しておきます。
```
sudo apt-get clean
```
タイムゾーン
```
 cat /etc/timezone
```
出力内容が下記であれば変更の必要はありません。
```
 Asia/Tokyo
```
このためタイムゾーンの修正は不要です。
もしタイムゾーンが日本(Asia/Tokyo)になっていない場合は、
```
  sudo dpkg-reconfigure tzdata
```
を実行して、タイムゾーンを日本(Asia/Tokyo)に変更しておきましょう。
ロケール

デフォルトでは英語ロケールしかサポートしていなくて困りそうです。
日本語のロケール(ja_JP.UTF-8)用のデータも生成するように設定します。
```
 sudo dpkg-reconfigure locales
```
下記のような画面になったら[カーソルキー](移動キー)で「ja_JP.UTF-8」を探し、スペースキーで「*」マークをつけます。

powershell_25.png

「*」マークをつけたらTABキーで<OK>を選択したら[リターンキー](エンターキー)を押します。
次にデフォルトのロケールを聞かれますが「None」にしておきます。

powershell_26.png

あとはリターンキー(エンターキー)を押せばロケールの選択画面が終了し、
日本語のロケールデータが生成されます。
これでLANG環境変数を「ja_JP.UTF-8」にすればコマンド等の出力結果が日本語になります。
```
export LANG=ja_JP.UTF-8
```
日本の時刻か確認します
```
 date
```
問題がなければホームディレクトリの.bashrcに言語の設定を追加しておきましょう。
```
echo export LANG=ja_JP.UTF-8 >> ~/.bashrc
```
日本語環境の導入
下記コマンドを順に実行してください
```
wget -q https://www.ubuntulinux.jp/ubuntu-ja-archive-keyring.gpg -O- | sudo apt-key add -
```
```
wget -q https://www.ubuntulinux.jp/ubuntu-jp-ppa-keyring.gpg -O- | sudo apt-key add -
```
```
sudo wget https://www.ubuntulinux.jp/sources.list.d/focal.list -O /etc/apt/sources.list.d/ubuntu-ja.list
```
```
sudo apt update
```
以下のコマンドを実行し、GPG鍵とレポジトリを追加します。
```
sudo apt-get upgrade
```
さらに日本語向けの追加パッケージをインストールします。
```
sudo apt-get install ubuntu-defaults-ja
```
powershell_27.png

powershell_28.png

[Y]を入力します。

これで日本語関係のパッケージは軒並み入りました、最後にオンラインマニュアルのパッケージを手動で追加します。
```
sudo apt-get install manpages-ja manpages-ja-dev
```
これで一通りパッケージはインストールしたので不要なファイルを削除しておきます。
```
sudo apt-get clean
```

ここまででLinux環境の構築は以上になります！お疲れさまでした！

        
