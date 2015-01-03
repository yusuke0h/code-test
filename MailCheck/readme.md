メールアドレスチェック
===========

# 背景
[RFC 5321](http://tools.ietf.org/html/rfc5321)に準拠したチェックは現実問題不可能に近い
> [PHPしか書けないザコがメールアドレス正規表現でガチ勢に挑んでみた - Qiita](http://qiita.com/mpyw/items/257eabe0b43b1e02e6f7)

よってある程度実装するところ，諦めるところを決めてチェックする．


# メールアドレスの条件
[Wikipedia](http://ja.wikipedia.org/wiki/%E3%83%A1%E3%83%BC%E3%83%AB%E3%82%A2%E3%83%89%E3%83%AC%E3%82%B9)にある条件を次に示す．

    ローカル部@ドメイン

## ローカル部に使用できる文字

1.  まず、次のASCII文字をそのまま並べた形式（RFC 5321ではDot-string、RFC 5322ではdot-atomと呼ぶ）が使用できる。
+ 大小のラテン文字（本来は大文字・小文字は区別されるが、実際には区別されていない実装がほとんどである[3]。一般的には小文字で表記される）
+ 数字
+ ! # $ % & ' * + - / = ? ^ _ ` { | } ~（実際には、プロバイダ側で利用可能な記号文字を一部のみに制限している場合が多い）
+ .（先頭と末尾以外で使用可能。2個以上連続してはならない）


2.  さらに、“" "”でくくられたquoted-stringの形式であれば、加えて次のASCII文字を使用できる[4]。
+ ( ) < > [ ] : ; @ ,
+ .（quoted-string中では制限はない）
+ スペース


3. さらにquoted-string中では、“\”を前につけたquoted-pairの形式であれば、加えて次のASCII文字を使用できる。
+ \ "

## ドメインに使用できる文字
+ ラテン文字・数字・“-”（先頭はラテン文字または数字）から成るサブドメインを“.”でつないだ形式で、A RRもしくはMX RR（またはそれらに名前解決されるCNAME RR）に名前解決される完全修飾ドメイン名 (FQDN)[6]。
+ “[ ]”でくくられたIPアドレス（例: [192.0.2.69][7]）。


## その他
ドメインの長さの最大値は253文字、メールアドレス全体の長さの最大値は254文字である[5]。

## 今回の実装範囲
今回実装する条件を次に示す．

*ローカル部*
+ 大小ラテン文字
+ 数字
+ 各種記号(ドットを含む，ドットの連続は未考慮とする)

*ドメイン部*
+ ラテン文字・数字・“-”（先頭はラテン文字または数字）から成るサブドメインを“.”でつないだ形式

*その他*
なし（文字数制限は正規表現でなく，プログラム言語側での実装が妥当と想定）
