---
title: "React"
---

# 1.基本の使い方

## React 基礎知識

最終課題 React 編に入っていきます！ちょっと難易度があがりますがラストスパート頑張っていきましょう！

### React とは?

そもそも React ってなに？というお話からです。

React とは、SPA(Single-Page Application) を実現する JavaScript フレームワークの一つです。Facebook 社によって開発され、Facebook の Web サイトでも利用されています。
2020 年 4 月現在の最新バージョンは 16.13.1 で、MIT ライセンスで公開されており、商用利用可能です。
JavaScript の中に直接 HTML/XML を記述する JSX という技術を利用しています。JavaScript は ES6 の文法である import やアロー関数を取り入れています。
JSX や ES6 文法を、Babel というトランスパイラで ES5 の JavaScript に変換しています。

また、React の長所として、以下の特徴があります。

### 宣言的な View

React は、インタラクティブなユーザインターフェイスの作成にともなう苦痛を取り除きます。アプリケーションの各状態に対応するシンプルな View を設計するだけで、React はデータの変更を検知し、関連するコンポーネントだけを効率的に更新、描画します。
宣言的な View を用いてアプリケーションを構築することで、コードはより見通しが立ちやすく、デバッグのしやすいものになります。

### コンポーネントベース

自分自身の状態を管理するカプセル化されたコンポーネントをまず作成し、これらを組み合わせることで複雑なユーザインターフェイスを構築します。
コンポーネントのロジックは、Template ではなく JavaScript そのもので書くことができるので、様々なデータをアプリケーション内で簡単に取り回すことができ、かつ DOM に状態を持たせないようにすることができます。

### 汎用性が高い

React と組み合わせて使用する技術に制限はありません。React を使って新しい機能を追加する際に、既存のソースコードを書き換える必要はありません。
React は Node を使ったサーバ上でもレンダーできますし、React Native を使うことでモバイルアプリケーションの中でも動きます。

### React を動かす

では早速 React が書けるように環境を整えていきましょう。

色々な方法がありますが、React プロジェクトを開始するときの最も一般的な方法を使っていきます。
React の開発元である Facebook 社が公式に提供しているもので、下記のようにコマンド１つで React プロジェクトを開始することができます。

```javascript
npx create-react-app[プロジェクト名]
```

それでは作業フォルダまで移動して下のコマンドを実行してみましょう。 今回は react-curriculum という名前のプロジェクトにします。

```javascript
npx create-react-app[react-curriculum]
```

プロジェクトが出来上がったら cd コマンドで react-curriculum まで移動し、npm start してみましょう。

ブラウザで http://localhost:3000/
にアクセスすると以下のような画面になります。

これで準備は完了です。
![](https://storage.googleapis.com/zenn-user-upload/49929990f447-20220309.png)

## Hello World!!

早速 Hello World を出力してみましょう！

（コンポーネントの種類として関数コンポーネントとクラスコンポーネントの２種類ありますが、このカリキュラムでは最近よく使われている関数コンポーネントで記述していきます。）

まずは下準備として、出来上がったプロジェクトを開き、src フォルダ内にあるファイルを全て消し、index.js と index.css を新規に作成しましょう。(index.css は tailwindCSS で使います。)

```
react-curriculum
     ┣━━━ public
     ┃       ┣━━━ index.html
     ┃       ┗━━━ その他ファイル
     ┣━━━━ src
     ┃      ┣━━━ index.js
     ┃      ┗━━━ index.css
     ┗━━━━ package.json等
```

そして index.js の新しいファイルに以下を記述します。

```javascript:index.js
import ReactDOM from "react-dom";

const App = () => {
  return <h1>Hello World!!</h1>
}

ReactDOM.render(<App/>,document.getElementById('root'));
```

再度ブラウザで確認すると Hello World が出力されました！ おめでとうございます！ 先程のコードについて一つずつみていきましょう。

```javascript
import ReactDOM from "react-dom";
```

まず react-dom ライブラリから ReactDOM という名前でモジュールをインポートします。
これに関してはおまじないと思ってもらって大丈夫です。
render する index.js 内でまず初めにインポートしてください。

次に下記の部分についてみていきましょう。

```javascript
const App = () => {
  return <h1>Hello World!!</h1>;
};
```

まず、App というコンポーネントを作り、アロー関数を指定します。
return の中身がこのコンポーネントで返す値です。今回は h1 タグの Hello World を返しました。

後ほど JSX 記法について詳しく解説しますが、JavaScript の中に HTML が埋め込めるとはこのことです。
基本的に JavaScript ですが、return 以降は HTML の世界です。
ReactDOM.render(,document.getElementById('root'));
そして最後のこの部分です。
ReactDOM には render という関数が用意されているので、第一引数に render 対象、第二引数に render 箇所を設定します。

public フォルダの index.html を確認すると、この id を持つ要素が確認できると思います。
要するに、App コンポーネントを HTML の root ID のところで render させてね、という意味です。

さて、今回は返す値が一行だったので簡単でしたが、複数行になる場合ルールがあります。
確認してみましょう。
複数行を返す場合

```javascript:index.js
import ReactDOM from "react-dom";

const App = () => {
  return (
    <>
    <h1>Hello World!!</h1>
    <p>Reactを勉強しましょう</p>
    </>
  );
};

ReactDOM.render(,document.getElementById('root'));
```

1 行を返す場合と比べて変わったのが

1. return 以降が( )で囲われている
2. return 後の複数の要素が空タグで囲われている。
   この２点です。

試しに空のタグをなくして`<h1>`と`<p>`タグを一番上の階層に持ってきてみてください。エラーが出るはずです。
今回空のタグで囲いましたが、`<div>`で囲ってやってもいいですし、`<Fragment>`で囲ってやってもいいです。
`<Fragment>`で囲う場合は、react からモジュールを import する必要があります。気になる方は調べてみてください。
とにかく、複数行を返す場合は return 以降は１つの要素でなければならないということを覚えておいてください。

ここまでで App コンポーネントをブラウザに表示することができました！

## JSX 記法について

前半でもお話しした通り、JSX 記法というのは JavaScript に HTML を入れられる記法です。
基本的に JavaScript で記述し、その中で return として返す値を HTML で記述することができます。

そしてここからさらに新しく勉強していきますが、JavaScript の中の HTML の世界にさらに JavaScript の世界を持ってくることができるのでそれをみていきましょう。

下記コードをみてください。
実装結果については先ほどと変わりませんが、書き方が変わっています。

```javascript:index.js
import ReactDOM from "react-dom";

const App = () => {
  const text = "Reactを勉強しましょう";

  return (
    <>
    <h1>Hello World!!</h1>
    <p>{text}</p>

  );
};

ReactDOM.render(,document.getElementById('root'));
```

変更した部分は、先程まで直接 HTML に書いていた"React を勉強しましょう"という文字列を一度変数に格納し、それを return 部分で展開しているところです。

このとき大事なのが、{}で囲っているところです。

HTML の中で JavaScript を書く際は、{}で囲う必要があります。

このように、直接書き込むのではなく必要な時に必要なパーツを持ってくるなどとすることによって汎用性の高いコンポーネントを作ることができるのが React の魅力です。

ちょっと紛らわしいですが、一番外側が JavaScript、return 以降が HTML、return の中で{} で囲まれた部分が JavaScript です。
慣れるまでは大変ですが、少しずつ慣れていきましょう！

### Component について

コンポーネントについて見ていきましょう。
アプリなどを作る場合一つのファイルに全て記述するのではなく、細かいファイルに分けてコンポーネントを作成し、それを受け渡しすることによって一つの大きいアプリを作ります。

どのように分けているかの例を見ていきましょう。Todo アプリの例です。
![](https://storage.googleapis.com/zenn-user-upload/2943d819b66a-20220309.png)

root で render しているのは App.js で、その中に TodoList.js があり、さらにその中に TodoForm.js と Todo.js があります。
それぞれのファイルにはファイル名と同じコンポーネントで値を返していて、それを他のファイルにエクスポートしており、親のコンポーネントではそれをインポートして返す値の中に入れています。

先ほどは例のため index.js に App というコンポーネントを作っていましたが、実際は App.js の中に App コンポーネントを作成し、index.js にエクスポートします。
それではこのアプリの中身を確認しましょう。

```
react-curriculum
     ┣━━━ public
     ┃       ┣━━━ index.html
     ┃       ┗━━━ その他ファイル
     ┣━━━━ src
     ┃      ┣━━━ index.js
     ┃      ┣━━━ index.css
     ┃      ┣━━━ App.js
     ┃      ┗━ components
     ┃             ┣━━━ TodoList.js
     ┃             ┣━━━ TodoForm.js
     ┃             ┗━━━ Todo.js
     ┗━━━━ package.json等
```

まず src フォルダの中に components フォルダを準備し、その中にコンポーネントとなるファイルを作っていきます。

以下ファイルの中身を見ていきますが、ファイルがどう render されているかを見るためなので細かい内容については省略しています。

```javascript:index.js
import ReactDOM from 'react-dom';
import App from './App';

ReactDOM.render(,document.getElementById('root'));
```

index.js は先ほどと同様 ReactDom を react-dom から import しています。そして、先ほど独立させた App コンポーネントをインポートしています。
App という名前のコンポーネントをパスからインポートするよ！

ということです。

そして html の root 部分で App コンポーネントを render しています。次に App.js を見ていきましょう。

```javascript:App.js
import React from "react";
import './App.css';
import TodoList from './components/TodoList';

const App = () => {
  return (
    <div className="todo-app">
    <h1>Todo App</h1>
    <TodoList />
    </div>
  );
};

export default App;
```

まずは react ライブラリから React をインポートします。こちらもおまじないです。コンポーネントを作る際にまずはじめに記述します。

そしてこちらでは css をインポートしていますね。
さらに、先ほどアプリの完成版を確認したときにわかったように、App.js の直下には TodoList.js が子コンポーネントとして入ってきますので、パスを指定してインポートします。

そして App コンポーネントの中身を記述します。
コンポーネントを埋め込む場所に<TodoList />
と記述することでインポートしたコンポーネントを差し込むことができます。そして最後に外側に、index.js に App コンポーネントを受け渡さなければならないので
export default App;

とします。

これで TodoList コンポーネントをインポートした App コンポーネントを index.js に受け渡すことができました。

```javascript:TodoList.js
import React from 'react';
import TodoForm from "./TodoForm";
import Todo from "./Todo";


const TodoList = () => {
    //コード省略
  return (
    <div>
    <h1>what's the plan for Today?</h1>
    <TodoForm />
    <Todo />
    </div>
  );
}

export default TodoList;
```

```javascript:TodoForm.js
import React from 'react';

const TodoForm = (props) => {
//コード省略
  return (
    <form className="todo-form" onSubmit={handlesubmit}>
　　　　　　　　   {/* コード省略*/}
          <input type="text"/>
          <button className="todo-button">Update</button>
    </form>
  );
}

export default TodoForm;
//Todo.js

import React from 'react';
import TodoForm from './TodoForm';

const Todo = ({todos, completeTodo, removeTodo, updateTodo }) => {
//コード省略
  return todos.map((todo, index) => (
    <div className= "todo-row complete">
       {/*コード省略*/}
       </div>
  ));
}

export default Todo;
```

後のコードは同じことの繰り返しです。一番小さいコンポーネントである Todo.js で TodoForm.js をインポートしているのはフォームに入力された値を受け取るためで、省略している中に受け取る処理が記述されますが、今回は割愛します。

### 記述のルールについて

上のコードをみて鋭い人は気づいているかもしれませんが、return 内は完全に HTML と同じというわけではありません。まず、class を付与する場合、className としてキャメルケースで記述する必要があります。
また、クリック時などのイベントに関しても同じで、onClick, onChange などとキャメルケースで記述します。
ファイル名については一文字目と単語の区切りで大文字を使うパスカルケースを使います。
例：

```
TodoForm.js
TodoList.js
```

そのコンポーネントがどんな動作を実現するかということを簡潔にファイル名にしましょう。

難しいルールがあるわけではありませんが、段々と慣れていきましょう。

## CSS

React において CSS の書き方はいろいろあります。
下記はこのカリキュラムでは使いませんが、こんな書き方もあるんだ〜程度で知識として持っておいてください。

直接記述する例：

```javascript
return (
    <div style={{width: "100%", padding: "16px"}}>
      <p style={{color "blue", textAlign "center"}}>Hello World!!</p>
    </div>
);
```

//JavaScript の style={ }の中にオブジェクトで CSS に対応する要素を指定するので{{}}となります。
//プロパティは""で囲み、text-align などはハイフンなしのキャメルケースになるところも注意が必要です。
styled components の例：

```javascript
import styled from "styled-components";
```

//スタイルを適用したコンポーネントを定義するという考え方です。
//下記の例：任意の変数を定義し、styled.[作りたい要素]`CSS`;とする。

```javascript
const StyledDiv = styled.div`
  padding: "8px";
`;

const StyledComponents = () => {
  retrun(
    //上で指定した、スタイルを適用したコンポーネントで要素を囲う。
    <StyledDiv>
      <p>このように使える</p>
    </StyledDiv>
    //padding:8pxが効いたdiv要素ができました。
  );
};

//もちろんstyled.p``などとすればpタグに対してスタイルを適用することもできます。
```

ここまでに紹介したものは一例ですので、興味がある方は調べてみてください。
さて、ようやく本題ですが、今回このカリキュラムでは、Tailwind という最近人気のフレームワークを使っていきましょう。

### Tailwind CSS

React だけでなく、通常の HTML や Vue などにも使用することができるフレームワークです。
className にパーツを追加することで、簡単にスタイルが当てられるものです。
まずは環境を整えましょう。

https://tailwindcss.com/docs/guides/create-react-app
こちらのサイトを参考に Setting up Tailwind CSS の部分から準備をしてください。

英語が厳しいという方は create react app tailwind などとググって日本語のやり方を探してください。
導入してしまえばもう簡単です。
スタイルを当てたい部分の className に、当てたいスタイルのプロパティを入れ込むだけです。
チートシートを貼っておきますので参考にしてください。

https://tailwindcomponents.com/cheatsheet/
https://tailwindcomponents.com/components

例:

```javascript
//TailwindCss

import React from "react";

const TailwindCss = () => {
  return (
    <h1 className="text-3xl text-green-400 bg-pink-200 p-4 m-28 w-48">
      TailwindCss
    </h1>
  );
};

export default Tailwindcss;
```

![](https://storage.googleapis.com/zenn-user-upload/ff12d8b50ecd-20220309.png)

よく使うような形のボタンなどはテンプレートがありますので、そこからカスタムしていくのがいいでしょう。
これで、課題に入っていく準備が整いました！！！ 以上で React の基礎編については終了になります。
しっかりポイントを抑えた上でカリキュラムに入っていきましょう！

---

# 2.props

## Props とは？

Props はコンポーネントに渡す引数のようなもので、コンポーネントは受け取った Props に応じて表示するスタイルや内容を変化させます。
例えばある文字を表示するコンポーネントがあるとして、よくある「通常時は黒文字、エラー時は赤文字」のような仕様の場合に、黒文字用のコンポーネントと赤文字用のコンポーネントをわざわざ作るようなことをするとコンポーネントの数が膨大になりますし、せっかく作ったコンポーネントの再利用がうまくできない状態になります。

そういった場合にある程度動的にコンポーネントを使いまわせるように Props で条件を渡してあげます。

例を見ていきましょう。まずは下のコードを見てください。

```javascript:components/Article.js
import React from "react";

const Article = () => {
  return (
    <div>
      <h1>タイトルです</h1>
      <p>中のテキストです</p>
    </div>
  );
};

export default Article;
```

Article というコンポーネントを作りました。

これを親コンポーネントで読み込んだ場合もちろん問題なく表示されますが、この場合 h1 と p の中身を直接打ち込んでしまっているので変更することができません。

これを使いまわせるようにするために使うのが props です。

では先ほどのコードを props を使って使いまわせるように編集していきましょう。
まずは親コンポーネントの App.js を見ていきましょう。

```javascript:App.js
import React from "react";
import Article from "./Article";

const App = () => {
  return (
    <Article title={"タイトルです"} text={"中のテキストです"} />
  );
};

export default App;
```

前回までに見たように return の中身で<Article />を子コンポーネントとして埋め込んでいますが、そのタグの中に任意の名称（今回は title と text）をつけて props を渡します。そして=の後に実際に渡す値を設定することができます。

次に受け取る側、子コンポーネントの中身を確認します。

```javascript:components/Article.js
import React from "react";

const Article = (props) => {
  return (
    <div>
      <h2>{props.title</h2>
      <p>{props.text}</p>
    </div>
  );
};

export default Article;
```

上記のようにまず props をアロー関数の中で引数として受け取ります。

そして受け取った props を表示させるために必要なところで{props.[親で設定したもの]}を入れています。

こうすることで、ブラウザの表示は同じですが使い回しの効くコンポーネントに変わりました。
親コンポーネントの=以降の中身を変更することで簡単にブラウザに表示する内容を変更することができます。
これで親コンポーネントから呼び出される際に中身を変更できるコンポーネントに変更されました。

簡単にまとめると、親コンポーネントから props という引数を受け取り、その渡された props を元にテキストの中身を変更すし、親コンポーネントに返す、という流れです。
もちろん中の文字だけでなく、色やフォントサイズなどいろいろ変更ができます。

Props の全体像は掴めましたか？それでは早速課題に入っていきます。

## 課題

### 【React_2-1】 3 つのボタンを実装しよう

今回も前回作ったものと同じプロジェクトで実装していきます。
components というフォルダを作りましたが、これと同じ階層に propsComponents というフォルダを作成してください。（src 直下です）
今回はここにコンポーネントを作っていきます。

また、App.js に記述してある前回までの必要のない部分は削除、またはコメントアウトしてください。
ブラウザで何も表示されないこととエラーが出ていないことを確認した上で今回の実装に入ってください。

それでは課題の内容について説明します。今回は色、テキスト、機能の違う３つのボタンを実装します。

![](https://storage.googleapis.com/zenn-user-upload/d951a4d10d4b-20220309.gif)

- ピンク、緑、黄色の形の同じボタンを３つ作成
- ボタンのテキストをそれぞれ変える
- ボタンをクリックした際にそれぞれのテキストを alert に表示
  props 受け渡しの課題ですのでスタイルについてはそこまで細かく見ませんが、できるだけ似せてください。
  スタイルは前回伝えたように Tailwind というフレームワークであてて、わからないことは適宜ググって頑張ってください。

また、ボタンのスタイルは最初から自分で実装してもいいですが、デキるエンジニアの方がスタイルのソースコードを載せているサイトがあります。貼っておきますのでぜひカスタムしながら進めてみてください。
ソースコードは HTML で書いてありますが、使うのは JSX ですので注意です。

※参考
Tailwind コンポーネント　　https://tailwindcomponents.com/
Tailwind チートシート　　https://tailwindcomponents.com/cheatsheet/

GOOGLE TIPS

> onClick
> alert

それでは、変数や関数をうまく使って頑張ってください！！

---

# 3.useState

## useState とは？

props に続いて重要になる概念が State です。その名の通りコンポーネントの状態を表す値です。

-　エラーがあるか -　ボタンが押せるか -　テキストボックスに何を入力したか

このような「状態」は全て State として管理し、イベント実行時等に更新処理を行う事で動的アプリケーションを実現していきます。

useState は React Hooks という機能群の中の useState という関数を用いて State を扱っていきます。
React の中に用意されているので、使用する場合は以下のようにインポートすることが必要です。

```javascript
import { useState } from "react";
```

使い方を見ていきます。

```javascript
const [現在の状態, 値を更新する関数] = useState(初期値);
```

これが基本になります。 ではまずは数字を更新するものを見ていきます。
useState で数字の管理

```javascript
const [num, setNum] = useState(0);
```

こんな感じですね。 上記の例では、[現在の数字,その数字を更新する関数]=初期値０と設定しています。 絶対にこの書き方にしないといけないわけではありませんが、暗黙の了解で

```javascript
const [〇〇, set〇〇] = useState();
```

というように、更新関数には set ＋現在の状態とつけるような形で名前をつけます。 では使い方を見ていきます。

```javascript
import { useState } from "react";
import React from "react";

export const App = () => {
  //useStateの宣言
  //numという変数, setNumで値の更新,useStateで初期値を０に設定
  const [num, setNum] = useState(0);
  //ボタンが押された時の処理
  const onClickButton = () => {
    //setNum()で値の更新しますよ
    //直前の値に１足すという更新です
    setNum((prevState) => prevState + 1);
  };

  return (
    <>
      <button onClick={onClickButton}>ボタン</button>
      <p>{num}</p>
    </>
  );
};
```

これで値の状態を管理することができるので、ボタンが押されるたびに前の値に１ずつ足されてどんどんカウントアップしていくようになりました。

さらに、それを p タグで JSX 内に記述しているので、`<p>`の値が随時更新されます。
ボタンを押すたび{num}の値が変更されていくので確認してみてください。

また、値の更新について以下の疑問を持った方もいるかもしれません。

```javascript
setNum((prevState) => prevState + 1); //この部分について
setNum(num + 1); //これじゃいけないの？
```

一度下の書き方に直して実装してみてください。

実はこれ、動くんです。公式の書き方も実は下の書き方だったりします。
ただ、複雑なコードになってくると下の書き方ではうまく動かない場合も出てきます。
なので両方いける場合もあるし公式の書き方だとバグが出る場合もある、ということを頭に入れた上で prevState を使った書き方を覚えてください。

参考までに、例えば（少し無理矢理ですが）setTimeout を使ってクリック後 X 秒後にカウントアップ処理を実行するとしましょう、X 秒経過前に連続でボタンを押してしまった場合に押した回数分が反映されない、というようなバグが発生します。

あとはユーザーの動きに関わらず直前にある重い処理などの影響を受けて思わぬバグが発生する場合もあるので prevState を使うことをお勧めします。

少しの違いですが結構重要になってきますので、気になる方はわざとバグを起こしてみてもいいかもしれませんね。

もう一つ数字の更新以外の例を見ていきましょう。
**ON/OFF を切り替えるボタン**
ボタンをセットし、現在の自分の状態が on であれば off に、off であれば on に切り替える処理にします。 お察しの通り true と false を使って状態を変更します。

```javascript:ToggleButton.js

import { useState } from "react";
import React from "react";

export const ToggleButton = () => {
  //初期値はtrue,falseをセットすることができます。
  const [open, setOpen] = useState(false);
  const toggle = () => {
    //現在の状態の反対にして！という処理
    setOpen(prevState=>!prevState)
};

  return (
    <>
      {/*三項演算子を使っているのでわからない方は調べてください*/}
      {/*クリックされたらtoggle関数を実行。openがtrueなら"OPEN",falseなら"CLOS"を表示*/}
      <button onClick={toggle}>{open ? "OPEN" : "CLOSE"}</button>
    </>
  );
};
```

簡単ですね！！！！ では課題に入っていきます。

## 課題

#### 【React_3-1】

今回の課題については前回に引き続き、同じプロジェクトの中で実装していきます。
新しく useStateComponents というフォルダを作り、そこに今回使うコンポーネントファイルを追加して実装してください。

App コンポーネントについては前回と同じです。わかりにくいと思うので今回必要のない分はコメントアウトしてください。
ブラウザで何も表示されないこととエラーが出ていないことを確認した上で今回の実装に入ってください。

以下が今回実装する課題になります。
![](https://storage.googleapis.com/zenn-user-upload/03c01d1b68df-20220309.gif)

![](https://storage.googleapis.com/zenn-user-upload/7cd6446a995b-20220309.gif)

![](https://storage.googleapis.com/zenn-user-upload/b579f969a0da-20220309.gif)

３種類の useState を使った実装が入ってきます。以下課題をざっくりまとめた内容です。

- タブを切り替える専用のボタンがある。
- カウントページではカウントアップ・ダウンのボタンクリックで下の数字が変更される。
- インプットフォームページでは入力欄に入力した文字が下に随時反映される。
  やることが多そうに見えますが、意外と単純です。

上記の解説だけではできないとは思いますので適宜ググって頑張ってください。

※参考

> Tailwind コンポーネント　　https://tailwindcomponents.com/
> Tailwind チートシート　　https://tailwindcomponents.com/cheatsheet/

GOOGLE TIPS

> 三項演算子
> `event.target.value` > https://tailwindcomponents.com/components https://tailwindcomponents.com/cheatsheet/

---

# 4.useEffect

## 再レンダリングについて

まず useEffect の内容に入る前に再レンダリングについて知る必要があります。

前回の課題でボタンをカウントアップした際、画面をリロードしているわけでもないのに数値が変わって画面の表示が変更されたかと思います。
これはコンポーネントが再レンダリングされているためです。

レンダリングを確認するために試しに前回の課題の App コンポーネントのアロー関数直後に
console.log で何か出力してみてください。

最初に画面を表示した際と、カウントアップ、カウントダウンボタンをクリックするたびに console に表示があることがわかります。

このように State が更新された時に関数コンポーネントは再び頭から処理が実行され、また State が更新されたらまた頭から・・・とぐるぐる回りながら差分がある DOM を検知し、変更を反映して画面を表示しているのです。

この「変更を検知してコンポーネントを再処理」することを再レンダリングと呼びます。

まずは「State 更新時にコンポーネントが再レンダリングされ、関数コンポーネントが再度頭から実行される」ということを覚えておきましょう。

## useEffect とは？

では今回の本題 useEffect に入っていきます。

useEffect とは useState と同じように React Hooks の機能群の１つです。useState と同様に React から import します。

```javascript
import { useEffect } from "react";
```

使う場合は以下の構文で使用します。

```javascript
useEffect(実行する関数, [依存する値]);
```

これだけだと意味がわからないかもしれませんが、文章で表現するなら useEffect の役割は
「ある値が変わった時に限り、ある処理を実行する」機能
になります。

例を見てみましょう。

```javascript
export const App = () => {
  useEffect(() => {
    alert();
  }, [num]);
  return {
    /*省略*/
  };
};
```

num という State の値が変わった時のみにアラートを表示したい場合の例です。

第一引数にはアロー関数でアラートを表示する処理を記述し、第２引数は必ず配列で指定します。
複数指定する場合は[num, num2]のように書きます。

注意点として、useEffect は依存配列に指定している値が変わった時に加え、コンポーネントのマウント時（一番最初）にも必ず実行されます。

説明だけだとわかりにくいと思うので、実際に以下のコードを書いてみてください。
前回の復習も兼ねて useState も使います。

```javascript:App.js
export const App = () => {

const [num, setNum] = useState(0);
//クリックされたら１を足す処理
const handleNum = ()=> {
  setNum(prevState => prevState+1)
};
useEffect(() => {
  //numの値が変わったらアラートを表示してね
  alert("numが変更されました");
},[num]);
//numの中身をコンソールに表示
console.log(num)
return <button onClick={handleNum}>ボタン<button>
};
```

ブラウザをリロードして動きを確認してみてください。
動作確認できましたか？

まず先ほども言ったようにマウント時（初回）に一度 useEffect の第一引数で指定した関数が走ります。
リロードしたら必ずアラートが出ますね。

そしてアラートを消し、num を変えるためにボタンをクリックすると再度アラートが表示されます。
num の値が変更されるたびにアラートが出るのが確認できましたでしょうか？
ただ、画面マウント時のみ第一引数を実行したいこともあると思います。
そんな時は、第二引数は空で渡してあげましょう。
先程のコードの useEffect の第二引数である[num]を変更します。
`[num]→[]`
画面をリロードしてみるとアラートが表示されるというところまでは同じですが、その後はボタンをクリックしてコンソールの num の値が変更されていってもアラートは出現しなくなりました。

useEffect の機能は理解できましたでしょうか？

なぜこのような機能があるというと前述したようにコンポーネントは再レンダリングを何度も繰り返しています。State の数が多くなってくると再レンダリングの回数も増えてきて、「再レンダリングのたびにこの処理を実行するのはコスト（時間）が無駄にかかるからこの値が変わった時だけにしたいな」という場面が多々あるためです。

こう言った副作用を制御したいケースで useEffect を使っていきましょう。

では課題に入っていきます。

## 課題

#### 【React_4-1】

今回も前回同様、App.js 内に記述してある前回までの課題はコメントアウトし、ブラウザに何も表示されていないこと、エラーが出ていないことを確認してから取り掛かってください。

また、src フォルダに useEffectComponents というフォルダを作り、そこにファイルを作成していってください。

useEffect の課題にはなりますが、useState を使った実装部分が難しいかもしれません。
最終課題に向かって頑張っていきましょう！

以下が課題になります。

![](https://storage.googleapis.com/zenn-user-upload/6a58e9cd300e-20220309.gif)

-　画面をリロードした時だけアラートが出る。 -　フォームに入力後、Enter、または送信で下のリストに追加される
ちなみに今回は useEffect の課題になりますので、

- 画面リロード時にアラートを表示する
- リストに文字が入った時にフォームの中身を空にするという処理は useEffect を使ってやってみてください！

また、ユーザーの動作によって起こりうるバグも考えてコーディングしてください。

※参考

> Tailwind コンポーネント　　https://tailwindcomponents.com/
> Tailwind チートシート　　https://tailwindcomponents.com/cheatsheet/

GOOGLE TIPS

> preventDefault
> map

それでは、変数や関数をうまく使って頑張ってくださいね！！

---

# 5.おまけ

## グローバルステートについて

※今回は課題はありませんが動作確認をします。
前回の useEffect の課題は使いますのでコメントアウトせずにそのまま残しておいてください。

ここまで React の基本に触れてきて、できるだけ細かくコンポーネントを作りそれを親コンポーネントに埋め込むことで一つの大きなアプリを作成できるということはわかってきたと思います。

ただ、大きなアプリになってきた時、ルートコンポーネントから最下層のコンポーネントまで５層以上になることも多々あります。

そんな時に最下層のコンポーネントで使うためだけに props を上の階層から受け渡し続けるとコードが複雑化しますし、場合によっては props を受け渡すためだけに存在するコンポーネントができてしまったりと、再利用ができない無駄なコンポーネントができてしまうこともあります。

このような、無駄な props の受け渡しが何度も繰り返されてしまうことをバケツリレーと称されます。

さらに、これまでに学んだようにコンポーネントは props が変更されるたびに再レンダリングされるので、バケツリレーによって State 更新時に全て再レンダリングが行われるなどの弊害も発生します。

そのため、どんなに深くても直接受け取れるグローバルな値を設定することによって上記のような無駄なコンポーネントを使わずともどのコンポーネントからもすぐにその値にアクセスすることができます。

グローバルステートとして管理するのは例としてユーザーの名前などが挙げられます。
ユーザーに名前を入力させてそれを定数に入れておき、必要な時にどのコンポーネントからでも参照できた方が毎回親から受け渡さなくていいので楽ですね。
context での State 管理
グローバルな State 管理を行うためのライブラリはいくつかありますが、React 自体が持っている Context という機能を使うことでも実現することができますので、今回はそれをお伝えします。

大きく分けて以下の３ステップです。

1. React.createContext で Context の器を作成する
2. 作成した Context の Provider でグローバル State を扱いたいコンポーネントを囲む
3. State を参照したいコンポーネントで React.useContext を使う

順番に確認していきましょう。
課題で使っているプロジェクトに作業していきます。

ステップ 1

- React.createContext で Context の器を作成する

まずは Context を保持するためのプロバイダーコンポーネントを作成します。
src の中に providers というフォルダを作り、その中に js ファイルを作ります。

今回は例として、SampleProvider としましょう。

React の中に createContext という関数が用意されているので、それを使って Context の器を作成します。

```javascript:SampleProvider.js

import { createContext } from "react";

export const SampleContext = createContext({});
```

SampleContext という名前で Context の器を作成していきます。
createContext の引数にはデフォルト値を設定することができます。ここでは空のオブジェクトとしています。
Context を参照する側のコンポーネントで使用するため export していることに注意してください。
第一ステップ終了です。

ステップ 2

- 作成した Context の Provider でグローバル State を扱いたいコンポーネントを囲む

Context の値を参照できるようにするためには、Provider で Context の値を参照したいコンポーネント群を囲む必要があります。

```javascript:SampleProvider.js
import { createContext } from "react";
export const SampleContext = createContext({});

//sampleProviderコンポーネントとします
export const SampleProvider = props => {

//動作確認のために適当なオブジェクトを定義
const sampleObj = { sampleValue: "test" }

//SampleContextの中にProviderがあるのでそれでchildrenを囲む
//valueの中にグローバルに扱う実際の値を設定

  return (
    <SampleContext.Provider value={sampleObj}>
      {props.children}
      </SampleContext.Provider>
  );
};
```

Provider コンポーネントはなんでも囲めるように Props として children を受け取るようにするのがポイントです。

先に作成した SampleContext の中に provider が用意されているのでそれを返却していきます。

この Provider コンポーネントは value という Props を設定することができ、ここにグローバルに管理する実際の値を渡していきます。

では作成した Provider を使って参照したい範囲のコンポーネントを囲んでいきましょう。今回はアプリ全体で参照できるようにしたいので index.js の中で App コンポーネントを囲みます。

次回課題で使う時のために、index.js は同じものを下にコピペして一旦退避させ、もとのコードはコメントアウトしてください。
複製した方に書いていきましょう。

```javascript:index.js
import ReactDOM from "react-dom";
import App from "./App.js";
import './index.css';
//以下を追加
import { SampleProvider } from "./providers/SampleProvider.js";
ReactDOM.render(
  <SampleProvider>
    <App />
  </SampleProvider>,
  document.getElementById("root")
);
```

App を囲んだので、App コンポーネントの中の全ての子コンポーネントから Context の値を参照できるようになりました！

これで Provider 周りの準備が整いました！

ステップ 3
ー State を参照したいコンポーネントで React.useContext を使う

では今回作ったコンポーネントが本当に別のコンポーネントから参照できるかどうか確かめていきましょう。

前回の useEffect の課題のファイルで確認します。

```javascript:
//useEffectComponentsの任意のjsファイル

//"react"からuseContextをimport
import { useContext } from 'react';
//作成したContextをimport
import { SampleContext } from '../providers/SampleProvider.js';

const List = () => {
  //省略 以下を追加
  //useContextの引数に参照するContextを指定する
  const contextValue = useContext(SampleContext);
  //console.logで中身を確認してみましょう
  console.log(contextValue);

  retrun (
    {/*省略*/}
  )
//console出力結果
{sampleValue: 'test'}
```

useContext で取得した値に Context で設定したオブジェクトが入っていることが確認できました。
このように Context の値を使用するコンポーネント側は、useContext を使いその引数に対象の Context を指定するだけで参照することができます。

今回は例で const sampleObj = { sampleValue: "test" }
として value に sampleObj を受け渡していましたが、ここを state にして他のコンポーネントからでも state の更新をすることもできます。

では以前やったようにボタンを on と off で変更できるようにするプログラムにを例にします。
true と false のステートを管理するものです。

```javascript:SampleProvider.js
const sampleObj = { sampleValue: "test" }//削除
const [isOpen, setIsOpen] = useState(false);//追加 ステートを定義

return (
    <SampleContext.Provider value={{ isOpen, setIsOpen}}{/*ステートを受け渡し*/}>
      {props.children}
    </SampleContext.Provider>
);
```

useState 使ってるので react から import するのも忘れないでくださいね〜

```javascript:
//useEffectComponentsの任意のjsファイル

import { useContext } from 'react';
import { SampleContext } from '../providers/SampleProvider.js';

const List = () => {
  //省略 前回のコードは削除し以下を追加
  //クリックされたらステートを反対にする処理
  const handleSampleClick = ()=>{
    setIsOpen(!isOpen);
  }
  //Context内のisOpenとsetIsOpenを取得
  const {isOpen,setIsOpen} = useContext(SampleContext)

  retrun (
    {/*省略　　　　　以下ボタンを追加　クリックされたらステートによってボタンの中身が変わる*/}
  <button onClick={handleSampleClick}>
    {isOpen ? "off" : "on" }
  </button>
  )
}
```

結果 ↓
![](https://storage.googleapis.com/zenn-user-upload/d52ab381415f-20220309.gif)

はい、簡単ですね！

課題はありませんがしっかり理解したら、今回の useEffect の js ファイルへの追加分は削除またはコメントアウトし、index.js も追加分を削除し、コメントアウトしていた部分は復活させてください。

ブラウザに何も表示されないようにしてもちろんエラーもないようにしてから進んでください。

もう少しです！頑張りましょう！

---

# 最終課題：Todo リストの作成

## 課題

#### 【React_5-1】

よくぞここまでやってきました！
最終課題は React で Todo リストを実装しよう(^ω^)です！

今まで学んできた知識をしっかり理解できていて、ロジックを考えることができればちょいちょいぐぐりながら完成できます。

では完成品を見てみましょう。
まずは Todo リストというタイトルの下に今日の予定はなんですか？というテキストがあり、その下にフォームがあります。フォームに入力し、Enter または横の追加ボタンを押すと、そのリストがどんどん下に作成されます。
リストの構成は、入力した内容、ピンクの編集ボタン、紫の削除ボタンです。
![](https://storage.googleapis.com/zenn-user-upload/fa87e6e3c96b-20220309.gif)

そしてピンクの編集ボタンを押すと、モーダルで現在入力されている内容がデフォルトで入ったフォームが出てきて、それを編集して変更ボタンを押すと、リストに反映されます。また、編集してもしなくても隣のキャンセルボタンをクリックすると
編集ボタンを押す前の画面に戻ります。
![](https://storage.googleapis.com/zenn-user-upload/a07c95826a93-20220309.gif)

紫の削除ボタンを押した場合は、本当に削除してよろしいですか？というモーダルが出てきて、はいを押すと選択したリストが削除され、いいえを押すと削除ボタンを押す直前の画面に戻ります。
![](https://storage.googleapis.com/zenn-user-upload/2ed17ce8747a-20220309.gif)

シンプルそうに見えますが、配列操作などで結構頭を使うと思います。

やり方は一つではありませんので、とにかく最後まで頑張ってみてください！
どうしても詰まった場合はメンターにご相談くださいね！
それでは頑張ってください！！！

参考

Tailwind コンポーネント　https://tailwindcomponents.com/
Tailwind チートシート　 https://tailwindcomponents.com/cheatsheet/

GOOGLE TIPS

> 分割代入
> モーダルウィンドウ
> スプレッド構文
> splice
