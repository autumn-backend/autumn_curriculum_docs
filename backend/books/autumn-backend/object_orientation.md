### オブジェクト指向とは¶

オブジェクト指向とは何でしょうか？オブジェクトとは、物体や物といった意味があります。つまり、さまざまな要素をモノに置き換えて、それぞれの要素の関係性に着目しながら開発を行なう手法のことを指します。

オブジェクト指向はプログラミングの世界だけのものではありません。業務システムの分析・開発などでも利用できます。わたしたちの日常生活も、オブジェクト指向で表現することができます。今回は、オブジェクト指向でプログラムを記述する方法を見ていきますが、オブジェクト指向の概念も習得しましょう。

「オブジェクト指向とは？」に明確な答えはありません。とても概念的なものです。
「愛とは何だ？」「国家とは何だ？」という問いに明確な答えがないのと一緒で、オブジェクト指向にもはっきりとした定義はありません。色んなサイトや技術書でも、その答えを伝えようとしていますが、どの説明もバラバラです。

この教材では、オブジェクト指向について概念的に追求することは避けます。まずは「そういうものがあるんだな」で大丈夫です。オブジェクトを「指向する」というところから、「なるべくオブジェクトを使うようにすれば良いんだな」くらいの認識でも持てれば、とりあえずは十分でしょう。

概念的なことよりは、オブジェクトの具体的な「使い方」をしっかり学んで欲しいと思います。実際、オブジェクトを活用すればプログラミングはとてもラクになりますし、セキュリティ面でも堅牢になるなど、そのメリットは非常に大きいものです。

#### ■オブジェクトを作成する技術
これは、クラスと呼ばれる単位を作成する技術です。つまり、フィールドやメソッドを作成する技術を指します。

#### ■オブジェクト間の関係性を設計する技術
オブジェクトとオブジェクトの関係性を設計する技術です。これにより、メンテナンスが行ないやすく、バージョンアップも容易になり、開発工数の削減へとつなげていくことにもなります。逆に、関係性があまりよくないと、オブジェクト指向の機能を適正に活用できないため、開発工数が急激に増加してしまうことがあります。

オブジェクト指向を学ぶ上で次の３つ要素を抑えておく必要があります。

・クラスの継承
・多態性
・カプセル化

#### ■クラスの「継承」とは

プログラミングとはいかに「使えるものを使いまわしていくか」が肝要になってきます。使い回すということはつまり、それだけ「コードを書くことが少なくなる」ことを意味します。コードが少なければ少ないほど人為的なミスが減り、バグの発生する確率も下がっていきます。

クラスは継承することによって、継承先となるクラスの機能を継承元が「使い回せる」ようになるのです。

前章で使ったHumanクラスを継承して、Studentクラスを作ってみましょう。まずは Humanクラスの定義部分のコードを再掲します。

・class_human.php
```
<?php
  class Human
  {
    public $name = '';
    public $weight = 0;

    public function __construct($name, $weight) {
      $this->name = $name;
      $this->weight = $weight;
    }

    public function eat() {
      $this->weight += 1;
    }
    public function run() {
      $this->weight -= 1;
    }
  }
```
それではこのHumanクラスを継承してみましょう。
class_human.php ファイルと同じ場所に class_student.phpファイルを作成して下さい。

コードは次の通りです。 require_once 文と、 extends キーワードに注目して下さい。

・class_student.php
```
<?php
  require_once 'class_human.php';

  class Student extends Human
  {
    public $score = 50;

    public function study() {
      $this->score += 1;
      $this->weight -= 1;
    }
  }

  $tanaka = new Student('田中', 69);
  $tanaka->study();
  print "成績:{$tanaka->score}　体重:{$tanaka->weight}".PHP_EOL;
  $tanaka->eat();
  print "成績:{$tanaka->score}　体重:{$tanaka->weight}".PHP_EOL;
```
まず冒頭の require_once で、Humanクラスが定義されている class_human.php ファイルを読み込んでいます。これがないと、プログラムは Human クラスがどこに定義されているのか探すことができず、エラーとなっていまいます。

require_once によって、Humanクラスを継承するための準備が整いました。
それでは、あらたに定義したStudentクラスで、読み込んだ Human クラスを継承してみましょう。

extends キーワードの後ろにクラス名を書くと、そのクラスを継承することができます。そして、継承したクラスの機能（プロパティやメソッド）をそのまま使うことができます。

Student はさらに自身の機能として $score プロパティと study() メソッドを持っています。

study() メソッドは、成績（$score）を 1 上げる一方で体重（$weight）を 1 減らします。
一生懸命勉強することで成績はあがりますが、頭を使うと糖分をたくさん消費しますよね。なので、痩せます（という設定でいきましょう）。

Studentクラスには weight というプロパティは存在しませんが、Humanからそれを受け継いでいます。したがって、Studentクラスで study() することによっても weight を減らすことができるわけです。
```
$tanaka = new Student('田中', 69);
```
これによって $tanaka オブジェクトは

・名前：田中
・体重：69
・成績：50（初期値50で固定）
というプロパティがセットされました。同時に

・study()：勉強すると成績が 1 上がり、体重が 1 減る
・eat()：食べると体重が 1 増える
・run()：走ると体重が 1 減る
という３つのメソッドが備わりました。

継承先となる親クラス（この場合はHuman）のプロパティとメソッドを引き継ぎつつ、新たに独自のプロパティとメソッドを持つことができる。これがクラス継承の特徴です。

あるクラスを継承したクラスを、さらに別のクラスが継承することもできます。

例えば Humanクラスを継承したStudentクラスを、さらに HighshoolStudentというクラスが継承することも可能です。この場合、HighschoolStudentクラスはStudentクラスの機能を備えつつ、またあらたに独自の機能をもつことができるのです。継承をすればするほど、その親クラスや祖先クラスの機能を引き継いで、クラスは多機能になっていきます。そして、その役割はより「具体的」になっていきます。

■多態性（ポリモーフィズム）
耳慣れない用語が登場しました。 多態性 とは「いろんなものになれる」という意味合いを持ちます。また、多態性は英語で ポリモーフィズム と言います。

前節でクラスの継承を学びましたが、今度はあらたに Teacherクラスを定義して、継承のおさらいをしつつ多態性についても学んでいきましょう。

・class_teacher.php
```
<?php
  require_once 'class_human.php';

  class Teacher extends Human
  {
    public $money;

    public function __construct($name, $weight, $money) {
      $this->name = $name;
      $this->weight = $weight;
      $this->money = $money;
    }

    public function work() {
      $this->weight -= 1;
      $this->money += 1;
    }

    public function eat() {
      $this->weight += 1;
      $this->money -= 1;
    }
  }

  $yamada = new Teacher('山田', 75, 100);
  $yamada->work();
  print "体重:{$yamada->weight}　お金:{$yamada->money}".PHP_EOL;
```
Humanクラスのみでは
・名前・体重というプロパティを持っている
・コンストラクタで名前・体重を初期化
・走ると体重が１減る
・食べると体重が１増える

Humanクラスを継承したTeacherクラスの概要はこうです。

・名前・体重・お金 という３つのプロパティを持っている
・コンストラクタで ３つ のプロパティを初期化する
・走ると体重が 1 減る
・働くと体重が 1 減るが、お金が 1 増える
・食べると体重が 1 増えるが、お金が 1 減る

Humanクラスを継承したことで、Teacherクラスは機能が増えているのがわかりますね。

特に大事なのは、元々Humanクラスで定義していたコンストラクタやeat()メソッドが、Teacherクラスでは再定義されていて、そのふるまい自体も変わっている点です。

これが 多態性 です。

最初に多態性とは「いろいろなものになれる」と表現しましたが、この場合では Humanクラスの eat()メソッドの働きは「体重を 1 増やす」だけでした。それに対し Teacherクラスで新たに定義されたeat()メソッドは、このふるまいを上書きして「体重を 1 増やすが、お金が 1 減る」という別のものになっています。

このようなメソッドの上書きを オーバーライド と呼びます。オーバーライドは多態性を実現する手法の１つです。

一般的なプログラミング言語では、この他にもうひとつ オーバーロード というものがあります。簡単に言うと、引数の個数を変えることで、同じ名前のメソッドでいくつものふるまいを定義できる、というものですが、PHPには残念ながらこの機能はありません。したがって本コースではオーバーロードについては扱いません。

### ■カプセル化
オブジェクト指向の３大要素の１つ「カプセル化」を説明するにあたり、
PHPのクラス定義には「アクセス修飾子」というものがあります。その種類は３つです。

・public
・protected
・private

public : publicなプロパティやメソッドは、どこからでも参照が可能です。
protected : protected だと、自分もしくは継承元のクラスからしか参照ができません。
private : privateなプロパティ・メソッドには、自身のクラス内部からしか参照できません。

具体例を見ていきましょう。

HumanクラスとTeacherクラスを使って説明していきます。
今一度コードを確認しておきましょう。

ただし、若干の修正を加えてあります。
まず、クラス定義のみを残し、実行部分（インスタンス化や結果表示などを行なっていたコード）は削除してあります。

それから、コンストラクタが重複しているので整理しています。
まず、Humanクラスのコンストラクタでは共通プロパティの名前と体重を初期化を行うようにして、 Teacherクラスではお金（$money）だけを初期化し、共通プロパティに関してはHumanクラスのコンストラクタを呼ぶようにします。そのような場合は parent::__construct() を使います。

・class_human.php
```
<?php
  class Human
  {
    public $name = '';
    public $weight = 0;

    public function __construct($name, $weight) {
      $this->name = $name;
      $this->weight = $weight;
    }

    public function eat() {
      $this->weight += 1;
    }
    public function run() {
      $this->weight -= 1;
    }
  }
```
・class_teacher.php
```
<?php
  require_once 'class_human.php';

  class Teacher extends Human
  {
    public $money;

    public function __construct($name, $weight, $money) {
      parent::__construct($name, $weight);
      $this->money = $money;
    }

    public function work() {
      $this->weight -= 1;
      $this->money += 1;
    }

    public function eat() {
      $this->weight += 1;
      $this->money -= 1;
    }
  }
```

これらのクラス定義のみのファイルを、もうひとつ別のファイルから読み込んで実行する形にしていきましょう。 class_human.phpやclass_teacher.phpファイルと同じ場所に、class_main.php というファイルも作成してください。そして、次の通りにコードを書いてください。

・class_main.php
```
<?php
  require_once 'class_teacher.php';

  $teacher = new Teacher('山田', 76, 100);

  // これ以降、実行結果を確認するコードを書いていきます。
```

それでは２つのクラスの アクセス権 を改善して、より安全なプログラムにしていきましょう。

よくよく考えてみると、先生のお金（$moneyプロパティ）は必ず「仕事をしたら増える」「食事をしたら減る」という設計になっていなければいけません。$money のアクセス修飾子は public なので、このままだとどこからでも参照されてしまい、金額も勝手に変更される恐れがあります。

（例）
・class_main.php
```
<?php
  require_once 'class_teacher.php';

  $teacher = new Teacher('山田', 76, 100);

  $teacher->money += 10000000;
  print "先生の所持金は". $teacher->money. "です。". PHP_EOL;
```

class_main.phpを実行してみて下さい
```
$ php class_main.php
```

// 出力結果 : 先生の所持金は10000100です。
このままではとても危険なプログラムです。なのでアクセス権を変更しましょう。

・class_teacher.php
```
<?php
  require_once 'class_human.php';

  class Teacher extends Human
  {
    private $money; // ★ public から private に変更

    public function __construct($name, $weight, $money) {
      parent::__construct($name, $weight);
      $this->money = $money;
    }

    public function work() {
      $this->weight -= 1;
      $this->money += 1;
    }

    public function eat() {
      $this->weight += 1;
      $this->money -= 1;
    }
  }
```

$money プロパティを public から private に変更しました。こうしておけば先ほどのコードを実行してもエラーになって、不正な金額変更ができないようになります。

・class_main.php
```
<?php
  require_once 'class_teacher.php';

  $teacher = new Teacher('山田', 76, 100);

  $teacher->money += 10000000;
  print "先生の所持金は". $teacher->money. "です。". PHP_EOL;

  // 出力結果 : Cannot access private property Teacher::$money in 〜（略）〜
```
（Teacherクラスの$moenyプロパティはプライベートのためアクセスできません）

アクセス権を private に変更することで、クラス外部からのアクセスを防ぐことができました。private でもクラス内部からはアクセス可能なので、work()メソッドで $money の値を変更することができます。eat()メソッドも同様です。
```
public function work() {
  $this->weight -= 1;
  $this->moeny += 1; // アクセス可能
}
```
今度は protected について考えてみましょう。

お金と同様に体重もまた、外部から勝手に変更されてはいけません。しかし、$weight プロパティはTeacherクラスではなく、継承先の Humanクラスで定義されています。これを private にしてしまうと、Teacherクラスからアクセスすることができなくなってしまいす。 work()メソッドやeat()メソッドで体重を変更することもできません。

そこで、このような時は protected を使います。

・class_human.php
```
<?php
  class Human
  {
    public $name = '';
    protected $weight = 0; // ★ public から protected に変更

    public function __construct($name, $weight) {
      $this->name = $name;
      $this->weight = $weight;
    }

    public function eat() {
      $this->weight += 1;
    }
    public function run() {
      $this->weight -= 1;
    }
  }
```
$weight を protected にしておけば、クラス外部から次のコードを実行されても

・class_main.php
```
<?php
  require_once 'class_teacher.php'

  $teacher = new Teacher('山田', 76, 100);

  $teacher->weight += 50;
  print "先生の体重は". $teacher->weight. "kgです。". PHP_EOL;

  // 出力結果 : Cannot access protected property Teacher::$weight in 〜（略）〜
```
体重が不正に50kgも追加されることもなく、また外部に晒されてしまう心配もありません。エラーになるだけです。

protected は継承先のクラスからは参照可能なため、Humanクラスを継承しているTeacherクラス内部からは、work()メソッド内で -1 したり、eat()メソッドで +1 することができます。

不正に体重を操作されるのはいけませんが、先生は体重が外部に知られることはあまり気にしていないかもしれません。このままだと体重の値を出力することもできないので、Teacherクラスに 読み取り専用 のメソッドを追加してみましょう。

・class_teacher.php
```
<?php
  require_once 'class_human.php';

  class Teacher extends Human
  {
    private $money;

    public function __construct($name, $weight, $money) {
      parent::__construct($name, $weight);
      $this->money = $money;
    }

    public function work() {
      $this->weight -= 1;
      $this->moeny += 1;
    }

    public function eat() {
      $this->weight += 1;
      $this->money -= 1;
    }

    // 読み取り専用メソッドを追加
    public function get_weight() {
      return $this->weright;
    }
  }
```
・class_main.php
```
<?php
  require_once 'class_teacher.php';

  $teacher = new Teacher('山田', 76, 100);

  // 読み取り専用メソッドでアクセス
  print "先生の体重は". $teacher->get_weight(). "kgです。". PHP_EOL;

  // 出力結果 : 先生の体重は76kgです。
```
このようにアクセス権を狭めつつ、値の読み取りをできるようにするメソッドのことを ゲッター といいます。また、書き込み用のメソッドも作ることができます。

```
public function set_weight($weight) {
  $this->weight = $weight;
}
```
今回の例では実装しませんでしたが、このようなメソッドを セッター と呼びます。
そして、これらの手法を駆使しながら外部からのアクセスを防ぐこと（＝隠蔽すること）を カプセル化 といいます。

### ■まとめ
オブジェクト指向プログラミングは、オブジェクトの機能を活用しながら、少ないコード量で安全なプログラムを作成することを目的としています。

それを実現するのが、本章で学んだ「継承」「多態性」「カプセル化」です。

最初は難しいかもしれません。カリキュラムで学んだだけではまだ実例不足です。オブジェクト指向の具体的なイメージはまだ確立されていないことでしょう。

こればかりは、実践を繰返しながら経験を積み重ねていくしかありません。最初は「全部理解しなきゃ」という焦りは捨てて、何となく納得のいった部分だけを覚えておけば十分です。リラックスしながら、カリキュラムを繰返し読んで下さい。また、サンプルコードを何度も書き直したり、自分でアレンジを加えてみるのも、良い学習方法です。

#### ■練習問題
Studentクラスを次の仕様を満たすように改良してください。

・Humanクラスを継承する（$weight が protected）

・$scoreプロパティをコンストラクタで任意の値に設定できるようにする

・$scoreプロパティのアクセス権を private にする

・examine()メソッドを追加する

・examine()メソッドでは $score の値を戻り値として返す

・class_main.phpをTeacherクラスではなくStudentクラスを扱えるように書き換えて下さい。

出力形式

（名前？）さんの成績は（成績？）点です。
