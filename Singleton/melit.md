# Singletonのメリット
*毎回作って壊すのではなく，使いまわすことでコストを下げられる*
Classからインスタンスを作成する処理は非常にコストがかかるため，使い回しが効く場合には毎回newせずに使いまわしたほうが良い．
また，ファイルを読み込む場合にも，毎回読み込むのではなく，キャッシュとして保持しておいたほうが良いことがある．
使用例
+ アプリケーションの設定ファイルをキャッシュで使う

でもこれ以外に使用例が思い浮かばない…
どんなとこで使うんだろ？



# おまけの学びメモ
## Javaのstatic
Classの特有のメンバ変数がstatic
Instanceに特有のメンバ変数やコンストラクタはstaticでない
[【Java】 staticって何？ | 一番かんたんなJava入門](http://nobuo-create.net/java-beginner-21/)

## ObjcectとClassとInstance
Classはまあ分かる
Instanceもまあ分かる　Classをnewしたもの
それではObjectとはなんなのか？
→ どうやら森羅万象のすべての「もの」Objectであるらしい
→ Instanceと同じ意味で使われている事が多い
