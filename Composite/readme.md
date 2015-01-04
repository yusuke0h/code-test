Compositeパターン
========

# Compositeパターンとは
GoFパターンのひとつ．
フォルダとファイルのように枝・葉が混在しているものに対し，枝葉を意識せずに同一の処理ができるもの．

構造
Componentクラス
 - Compositeクラス
 - Leafクラス

Componentクラス：枝・葉の親クラスとなり，クライアントから共通にアクセスするAPIとなる
Ccompositeクラス：枝のクラス，Componentのサブクラス，子を持つ，Componentと同じアクセスを実装する
Leafクラス：葉クラス，Componentのサブクラス


# メリット
クライアント側で枝なのか葉なのかを意識せずに同一の処理が行えること

# 使用例
+ ケーキ作り
+ 写真と組織
+ ファイルとフォルダ

# 実装
ハンバーガーショップのメニューを題材にする．
単品とセットをそれぞれ葉と枝とし，合計金額を計算する．

# 結果
    [112] pry(main)> c = ShoppingCart.new
    => #<ShoppingCart:0x007fbce32ba668 @items=[], @name="ShoppingCart">
    [113] pry(main)> c.add_item Burger.new
    => [#<Burger:0x007fbce329a728 @name="Burger">]
    [114] pry(main)> c.items
    => [#<Burger:0x007fbce329a728 @name="Burger">]
    [115] pry(main)> c.add_item Set.new
    => [#<Burger:0x007fbce329a728 @name="Burger">,
     #<Set:0x007fbce31f0070
      @name="SetMenu",
      @sub_items=
       [#<Burger:0x007fbce31ebf48 @name="Burger">,
        #<FrenchFly:0x007fbce31ebed0 @name="FrenchFly">,
        #<Drink:0x007fbce31ebe80 @name="Drink">]>]
    [117] pry(main)> c.items
    => [#<Burger:0x007fbce329a728 @name="Burger">,
     #<Set:0x007fbce31f0070
      @name="SetMenu",
      @sub_items=
       [#<Burger:0x007fbce31ebf48 @name="Burger">,
        #<FrenchFly:0x007fbce31ebed0 @name="FrenchFly">,
        #<Drink:0x007fbce31ebe80 @name="Drink">]>]
    [118] pry(main)> c.get_price
    => 650.0
    [119] pry(main)> c.add_item FrenchFly.new
    => [#<Burger:0x007fbce329a728 @name="Burger">,
     #<Set:0x007fbce31f0070
      @name="SetMenu",
      @sub_items=
       [#<Burger:0x007fbce31ebf48 @name="Burger">,
        #<FrenchFly:0x007fbce31ebed0 @name="FrenchFly">,
        #<Drink:0x007fbce31ebe80 @name="Drink">]>,
     #<FrenchFly:0x007fbce38ad2f0 @name="FrenchFly">]
    [120] pry(main)> c.items
    => [#<Burger:0x007fbce329a728 @name="Burger">,
     #<Set:0x007fbce31f0070
      @name="SetMenu",
      @sub_items=
       [#<Burger:0x007fbce31ebf48 @name="Burger">,
        #<FrenchFly:0x007fbce31ebed0 @name="FrenchFly">,
        #<Drink:0x007fbce31ebe80 @name="Drink">]>,
     #<FrenchFly:0x007fbce38ad2f0 @name="FrenchFly">]
    [121] pry(main)> c.get_price
    => 800.0

# 感想
再帰的に処理が回っていて面白い．
セットメニューを追加した後にget_priceをした時の感動
確かに枝葉を意識せずに追加できる点が面白い

# 参考
[Composite - GoFデザインパターン～STEP3：どんどん使ってみよう - PHPによるデザインパターン入門 - Do You PHP?](http://www.doyouphp.jp/phpdp/phpdp_02-3-6_composite.shtml)




