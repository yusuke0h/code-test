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