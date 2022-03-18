---
title: "TypeScript"
---

# 1.JS => TS への変換

## TypeScript 基礎

TypeScript はマイクロソフトによって開発され、メンテナンスされているフリーでオープンソースのプログラミング言語です。大きな特徴として、

- JavaScript に対して、型定義などの機能を追加したもの。
- JavaScript の最新仕様である、ES2018 の構文仕様が使え、JavaScript 言語の完全なスーパーセットになっている。(JavaScript の構文等がそのまま使うことができる。)
- TypeScript を書く際は、TypeScript ファイル(.ts) を 作成する必要があり、そのファイルを JavaScript ファイル(.js)にコンパイルししている。

### なぜ型を追加する必要があるのか？

型があることにより、コードを書いている時点でエラーに気づくことができます。コンパイルをするときに、型の制約のチェックを行うことにより、すぐにエラーを修正可能。型を追加することによって効率的に開発を進めることが可能となっているのがメリットとして挙げられます。

#### number で定義しているものに string 型のものを入れてしまった場合

```typescript
let num: number = 1;
let num: number = "hoge"; // エラー: `string` を `number` に代入できません
```

### 基本アノテーション

TypeScript では、変数、定数、関数、引数などの後ろに 「: 型名」を指定することで型を宣言することができます。アノテーションとはメソッドを装飾して、そのメソッドが何に使われるかを定義する文法のことです。

#### 配列(Arrays)

TypeScript は、配列に専用の構文を提供し、コードにアノテーションを付けて文書化するのを容易にします。
構文は、基本的に`[]`を有効な型アノテーションに後置します(例えば `:boolean[]`)。
これは通常行う配列操作を安全に行うことを可能にし、誤った型のメンバーを割り当てるなどのエラーからあなたを守ります。これは以下のとおりです。

#### ジェネリクス(Generics)

Generics は抽象的な型引数を使用して、実際に利用されるまで型が確定しないクラス・関数・インターフェイスを実現する為に使用されます。
C#や Java といった言語も Generics を搭載しており、TypeScript に限った機能ではありません。

これだけだとイメージが湧きづらいと思いますので、実際にサンプルコードを交えて理解していきます。

#### Generics の簡単な具体例(関数編)

下記のように同じようなコードを別の型で繰り返す場合があるとします。

```Typescript
// number型
function test(arg: number): number {
  return arg;
}

// string型
function test2(arg: string): string {
  return arg;
}

test(1); //=> 1
test2("文字列"); //=> 文字列
```

これを Generics を使用する事で下記のように書く事が可能です。
test の引数は string 型だけ、また test の引数は number 型だけが許されるようになります。

```typescript
function test(arg: T): T {
  return arg;
}
test(1); //=> 1
test("文字列"); //=> 文字列
//※ Genericsでも型推論ができるので、引数から型が明示的にわかる場合は省略が可能
test("文字列２"); //=> "文字列２"
```

#### 複数の型引数を定義する

複数の型引数を使用することも可能です。
型引数の名前に特に決まりはありませんが、慣習的に T,U 等の大文字のアルファベットが使用される事が多いです。

```typescript
function test(arg1: T, arg2: U, arg3: P): P {
  return arg3;
}
//※ Genericsでも型推論ができるので、引数から型が明示的にわかる場合は省略が可能
test("文字列", true, 4); //=> 4
```

Generic 関数の様に型引数を渡す事で、クラスもジェネリック化する事が可能です。
型引数 T はメソッドの返り値の型や、引数の型として、クラスを通して使用されている事が見てとれます。

```typescript
class Klass {
  item: T;
  constructor(item: T) {
    this.item = item;
  }
  getItem(): T {
    return this.item;
  }
}
let strObj = new Klass("文字列１");
strObj.getItem(); //=> "文字列１"
let numObj = new Klass(5);
numObj.getItem(); //=> 5
```

##### Generics の簡単な具体例(インターフェイス編)

こちらも上記の Generic 関数・クラスと同じ要領で Generic インターフェイスを作成する事が可能です。

```typescript
interface KeyValue {
  key: T;
  value: U;
}
let obj: KeyValue = { key: "文字列", value: 2 }; //= {key: "文字列", value: 2}
```

#### 型引数に制約を付ける

ここまで紹介した Generic の型引数はどんな型の引数も受け入れてきました。
しかし、引数で受け入れる値を特定の型のみに制限したい場合もあります。

例えば下記の例では arg の name というプロパティを取得しようとしていますが、全ての型が name を持つ訳ではないので、コンパイラが警告を出しています。

```typescript
function getName(arg: T): string {
  return arg.name; // Property 'name' does not exist on type 'T'.
}
// argの型はこの時点でnameを持つか不明なので、コンパイラは警告を出す。
```

その様な場合、下記の様に書くことで、T は extends で指定したインタフェースを満たす型でなければならないということを指定する事ができます。
これにより、実装時にコンパイラエラーも起こりません。
また、関数を呼び出す際に制約に違反する引数を渡した場合にはエラーを出してくれます。

```typescript
interface argTypes {
  name: string;
}

function getName(arg: T): string {
  return arg.name;
}
getName({ name: "鈴木一郎" });
```

#### プリミティブ型(Primitive Types)

JavaScript プリミティブ型は、TypeScript の型システムでカバーしています。これは、以下に示すように `string`、`number`、 `boolean`を意味します。

```typescript
var num: number;
var str: string;
var bool: boolean;

num = 123;
num = 123.456;
num = "123"; // Error

str = "123";
str = 123; // Error

bool = true;
bool = false;
bool = "false"; // Error
var boolArray: boolean[];

boolArray = [true, false];
console.log(boolArray[0]); // true
console.log(boolArray.length); // 2
boolArray[1] = true;
boolArray = [false, false];

boolArray[0] = "false"; // Error
boolArray = "false"; // Error
boolArray = [true, "false"]; // Error
```

## 課題

#### 【TS_1-1】 次の関数 isPositive は、数値を受け取ってそれが 0 以上なら true、0 未満なら false を返す関数です。

この関数に正しく型アノテーションを付けてください。型アノテーションとは、引数や返り値の型をソースコード中に明示することです。

```typescript
function isPositive(num) {
  return num >= 0;
}

// 使用例
isPositive(3);

// エラー例
isPositive("123");
```

---

# 2.型付けトレーニング

## 特殊な型

上記でカバーしたプリミティブ型以外にも、TypeScript では特別な意味を持ついくつかの型があります。
これらは any、null、undefined、unionvoid です。

### any

any 型は、TypeScript 型システムにおいて特別なものです。
any は型システムのすべての型と互換性があります。つまり、any 型の変数には何でも代入できるし、その変数を
何にでも代入できるということです。

```typescript
let hoge: any;

hoge = 'name'
hoge = 123

let num: number;
hoge = num;
nullとundefined
nullとundefinedは、any型と同じ扱いをします。
let num: number;
let str: string;

num = null;
str = undefined;
```

### unicon

union 型は、プロパティを複数の型を定義して、そのどれかに当てはまると使用可能にできるものです。

```typescript
type strOrNum = String | Number;

strOrNum = "hoge";
strOrNum = 123;
strOrNum = true; // Error
```

### void

void は関数に戻り値がない時に使います。

```typescript
function log(message): void {
  console.log(message);
}
```

### 型エイリアス(Type Aliases)

一度作成した型を引用して使うことができます。

```typescript
type Mojiretsu = string;

const fooString: string = "Hello";
const fooString2: Mojiretsu = "Hello";

const example1 = {
  name: "foo",
  age: 26,
};

type Profile = {
  name: string;
  age: number;
};

const example2: Profile = {
  name: "buzz",
  age: 27,
};

// example1のデータ構造を設定できる
type Profile2 = typeof example1;
```

## インターフェース(Interfaces)

インターフェースは、複数の型アノテーションを単一の名前付きアノテーションに合成するための、TypeScript における主要な方法です。次の例を考えてみましょう。

```typescript
interface Name {
  first: string;
  second: string;
}

var name: Name;
name = {
  first: "John",
  second: "Doe",
};

name = {
  // Error : `second` is missing
  first: "John",
};
name = {
  // Error : `second` is the wrong type
  first: "John",
  second: 1337,
};
```

## 課題

#### 【TS_2-1】 1 人のユーザーのデータを表すオブジェクトは、name プロパティと age プロパティ、そして private プロパティを持っています。name は文字列、age は数値、private は真偽値です。ユーザーデータのオブジェクトの型 User を定義してください。

```typescript
function showUserInfo(user: User) {
  // 省略
}

// 使用例
showUserInfo({
  name: "John Smith",
  age: 16,
  private: false,
});

// エラー例
showUserInfo({
  name: "Mary Sue",
  private: false,
});
const usr: User = {
  name: "Gombe Nanashino",
  age: 100,
};
```

#### 【TS_2-2】 以下の Person インターフェースの age プロパティはオプショナルにし、age プロパティの値を省略して下さい。

```typescript
interface Person {
  name: string;
  age: number;
}

//使用例
const p1: Person = { name: 'Taro', age: 100 };  // OK
const p2: Person = { name: 'Jiro' };  // OK
console.log(p1.age);  //=> 100
console.log(p2.age);  //=> undefined

以下のコードはコンパイルエラーが起きます。
{ name: "kenji", age: 90 };が代入できるように修正してください。
interface Foo {
  name: string;
}
let obj: Foo = { name: "kenji", age: 90 };
```

#### 【TS_2-3】 以下のコードで定義される関数 sumOfPos は、数値の配列を受け取って、そのうち 0 以上の値の和を返す関数です。適切な型アノテーションをつけてください。

```typescript
function sumOfPos(arr) {
  return arr.filter((num) => num >= 0).reduce((acc, num) => acc + num, 0);
}

// 使用例
const sum: number = sumOfPos([1, 3, -2, 0]);

// エラー例
sumOfPos(123, 456);
sumOfPos([123, "foobar"]);
```

---

# 3.関数

## 関数

JavaScript では、関数は第一級のオブジェクトであり、他のオブジェクトと同様に扱うことができます。
つまり、変数に割り当てる、関数に関数を渡したり返してもらう、new をすればコンストラクタになる、など色々できます。
色々できるということは、TypeScript では色々な型システムを使って実現することになります。

### function キーワードの関数定義

- 引数と return で返される値に型定義する

```typescript
function bmi(height: number, weight: number): number {
  // function 関数名(引数名: 引数の型定義): returnで返される型定義
  return weight / (height * height);
}
```

### 無名関数の関数定義

- 関数が格納された変数自体にも型定義する

```typescript
let bmi: (height: number, weight: number) => number = function (
  height: number,
  weight: number
): number {
  return weight / (height * height);
};
```

### アロー関数による関数定義

上記のものをアロー関数で表す。

```typescript
let bmi: (height: number, weight: number) => number = (
  height: number,
  weight: number
): number => weight / (height * height);
// アロー関数省略記法
```

### パラメータについて

パラメータとは、関数に渡される名前付きの変数のことを指します。
対して、関数を呼び出すときに関数を渡すデータのことを引数と呼びます。

#### オプショナルなパラメータの定義

- 変数名の末に?を付与する事でオプショナルなパラメータの型定義ができる
- 下のコードの場合、第三引数に設定されたパラメーターはあってもなくてもエラーにはならない

```typescript
let bmi: (height: number, weight: number, printable?: boolean) => number = (
  height: number,
  weight: number,
  printable?: boolean
): number => {
  const bmi: number = weight / (height * height);
  if (printable) {
    console.log(bmi);
  }
  return bmi;
};

bmi(1.75, 70);

// bmi(身長, 体重, console.logで出力するかどうか？)
// bmi(1.75, 70, true) 出力する
// bmi(1.75, 70, false) 出力しない
// bmi(1.75, 70) 出力しない
```

# 課題

#### 【TS_3-1】 以下のコードで定義される関数 isPositive は、数値を受け取ってその数値が 0 以上なら true を、0 未満なら false を返す関数です。以下のコードに合うように適切な型 IsPositiveFunc を定義してください。

```typescript
const isPositive: IsPositiveFunc = (num) => num >= 0;

// 使用例
isPositive(5);

// エラー例
isPositive("foo");
const res: number = isPositive(123);
```

#### 【TS_3-2】 以下のコードで定義される getSpeed は、'slow', 'medium', 'fast'のいずれかの文字列を受け取って数値を返す関数です。この関数に他の文字列を渡すのは型エラーとしたいです。この条件を満たすように型 Speed を定義してください。

```typescript
type Speed = /* ここを入力 */;

function getSpeed(speed: Speed): number {
  switch (speed) {
    case "slow":
      return 10;
    case "medium":
      return 50;
    case "fast":
      return 200;
  }
}

// 使用例
const slowSpeed = getSpeed("slow");
const mediumSpeed = getSpeed("medium");
const fastSpeed = getSpeed("fast");

// エラー例
getSpeed("veryfast");
```

#### 【TS_3-3】 以下のコードで定義される関数 myFilter は、配列の filter 関数を再実装したものです。

- myFilter 関数に適切な型アノテーションを付けてください。
- myFilter 関数は色々な型の配列を受け取れる点に注意してください。必要に応じて myFilter に型引数を追加しても構いません。

```typescript
function myFilter(arr, predicate) {
  const result = [];
  for (const elm of arr) {
    if (predicate(elm)) {
      result.push(elm);
    }
  }
  return result;
}

// 使用例
const res = myFilter([1, 2, 3, 4, 5], (num) => num % 2 === 0);
const res2 = myFilter(["foo", "hoge", "bar"], (str) => str.length >= 4);

// エラー例
myFilter([1, 2, 3, 4, 5], (str) => str.length >= 4);
```

---

# 4.クラス、クラスの継承

## クラスの型定義

- クラスのトップレベルで型宣言
- constructor(関数)の引数にも型宣言
- constructor(関数)の戻り値の型宣言は行わない(TypeScript の言語仕様)

```TypeScript
class Person {
  // クラスの型宣言
  name: string
  age: number
  // constructorの引数に型宣言
  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }
  // クラスのメソッド(関数)に型宣言
  profile(): string {
    return `name: ${this.name} age: ${this.age}`
  }
}
let taro = new Person('Taro', 30)

console.log(taro.profile())  // name: Taro age: 30
```

### アクセス修飾子

- public：全体からアクセスできる
- private：クラス内部からのみアクセスできる
- protected：クラスを継承した小クラスからでもアクセスできる

```TypeScript
class Person {
  // publicはアクセスの制約がない。省略できる。
  public name: string
  // クラス内部からのみアクセスできる
  private age: number
  // 継承した子クラスからもアクセスできる
  protected nationality: string

  constructor(name: string, age: number, nationality: string) {
    this.name = name
    this.age = age
    this.nationality = nationality
  }

  profile(): string {
    // ageはprivateなのでクラス内部のみアクセスできる
    return `name: ${this.name} age: ${this.age}`
  }
}

let taro = new Person('Taro', 30, 'Japan')

console.log(taro.name)  // Taro
console.log(taro.age)  // ageはprivateなのでコンパイルエラー
console.log(taro.profile())  // privateのageを含むメソッドなのでエラーになる
```

Person クラスを継承した Android クラスを作成してみる

```TypeScript
class Android extends Person {
  constructor(name: string, age: number, nationality: string) {
    // 親クラスのconstructorメソッドを継承
    super(name, age, nationality)
  }
  profile(): string {
  // ageはprivateなのでアクセスできないのでエラーになる
  // nationalityはprotectedなのでアクセスできる
    return `name: ${this.name} age: ${this.age}, nationality: ${this.nationality} `
  }
}
```

#### constructor の便利な書き方

アクセス修飾子を constructor メソッドの引数に書くことで、クラスの型宣言、初期化が可能

この場合 public 修飾子は省略しない

以下 sample① と sample② は同じ結果になる

```TypeScript
//sample①
class Person {
  constructor(public name: string, protected age: number) {}
}

const me = new Person('foo', 30)
console.log(me)  // Person { name: 'foo', age: 30 }
//sample②

class Person {
  name: string
  age: number
  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }
}

const me = new Person('foo', 30)
console.log(me)  // Person { name: 'foo', age: 30 }
```

クラスの継承

- 既存のクラスを拡張して新たなクラスを作り上げる
- 継承は extends を使用する
- 派生クラスの constructor には super の呼び出しが必要

```TypeScript
class Animal {
  constructor(public name: string) {}

  run(): string {
    return 'I can run'
  }
}
// Animalクラスを継承
class Lion extends Animal {
  public speed: number
  constructor(name: string, speed: number) {
    super(name)
    this.speed = speed
  }
  run(): string {
    //super.run()で親のrunメソッドを呼び出す
    return `${super.run()} ${this.speed}km/h.`
  }
}

console.log(new Animal('Mickey').run()) // I can run
console.log(new Lion('Simba', 80).run()) // I can run 80km/h.
```

### 抽象クラスと抽象メソッド

- 大規模なアプリケーション開発をする時に便利
- 抽象メソッドは継承するクラスで実装しなければならないので、実装漏れを防ぐ。
- 抽象化は abstract を使用する
- 抽象メソッドは必ずオーバーライドをする必要がある
- 抽象メソッドの宣言はシグネチャーと言う

```TypeScript
// 抽象メソッドは抽象クラスの中でしか使えない
abstract class Animal {
  abstract cry(): string
}

class Lion extends Animal {
  cry() {
    return 'roar'
  }
}

// 抽象メソッドが定義されていないのでエラーになる
class Tiger extends Animal {}
```

## 課題

#### 【TS_4-1】 クラス : class Animal の作成

1. 名前、年齢の定義
2. 名前、年齢を console.log で呼び出す関数(それぞれ作成)

以上を定義した後、インスタンス(インスタンス名は自由)を生成し、名前・年齢を呼び出す
以上を実装せよ。

#### 【TS_4-2】クラスの継承

3-1 で作成したクラスを継承させ、

1. 種類(ex)犬、猫など、、、)を定義
2. 「私は ○○ を飼っています。名前は ○○ で年齢は ○○ です。」という文を呼び出す関数
   以上を定義した後、インスタンス(インスタンス名は自由)を生成し、「私は ○○ を飼っています。名前は ○○ で年齢は ○○ です。」という文章を console.log で出力させよ。

---

# 5.Getter、Setter

## getter と setter

ゲッターとセッターは、アクセスを制御する時に便利です。

- get はアクセスだけできる
- set は値を設定するときのみ実行される private に設定された変数はアクセス(書き換えも)できないが、
  アクセスだけしたい時(get)、値だけ書き換えたい時(set)に便利。

```TypeScript
// * owner
//   * 所有者
//   * 初期化時に設定できる
//   * 途中で変更できない
//   * 参照できる

// * secretNumber
//   * 個人番号
//   * 初期化時に設定できる
//   * 途中で変更できる
//   * 参照できない

class MyNumberCard {
  // 慣習的にアンダースコアでリネームする
  private _owner: string
  private _secretNumber: number

  constructor(owner: string, secretNumber: number) {
    this._owner = owner
    this._secretNumber = secretNumber
  }

  get owner() {
    return this._owner
  }

  set secretNumber(secretNumber: number) {
    this._secretNumber = secretNumber
  }

  debugPrint() {
    return `secretNumber: ${this._secretNumber}`
  }
}

let card = new MyNumberCard('fooさん', 1234567890)

console.log(card.owner)  // fooさん
console.log(card.secretNumber)  // undefined
console.log(card.debugPrint())  // secretNumber: 1234567890
```

### readonly 修飾子

変数には const がありましたが、プロパティにも readonly があります。readonly を付与したプロパティは、
プロパティ定義時および、コンストラクタの中身でのみ書き換えることができます。

```TypeScript
class VisaCard {
  constructor(public readonly owner: string) {
    this.owner = owner
  }
}

let myVisaCard = new VisaCard('foo')

console.log(myVisaCard.owner)  // foo
myVisaCard.owner = 'buzz'  // コンパイルエラー
```

## 課題

### Getter/Setter

#### 【TS_5-1】 以下の条件に従ったプログラムを書いてください。

1.console.log で「好きなフルーツは fruitsname(変数名)です。」を出力する関数
2.private 変数 fruitsname を取得する getter の定義
3.private 変数 fruitsname に値を設定する setter の定義
以上を満たす class Fruits を実装し、以下のようにインスタンスを作成後、

```TypeScript
let (命名何でも可) = new Fruits("ぶどう");
```

1.変数変更前の「好きなフルーツは fruitsname です。」を出力
2.fruitsname を自分の好きなフルーツに変えて console.log で出力 3.変数変更後の「好きなフルーツは fruitsname です。」を出力

以上を実装せよ。

---

# 6.最終課題

## 課題
