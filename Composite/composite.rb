class Menu
  attr_reader :name

  def initialize name
    @name = name
  end

  def get_price
    0.0
  end
end

class Burger < Menu
  def initialize
    super('Burger')
  end

  def get_price
    200.0
  end
end

class FrenchFly < Menu
  def initialize
    super('FrenchFly')
  end

  def get_price
    150.0
  end
end


class Drink < Menu
  def initialize
    super('Drink')
  end

  def get_price
    100.0
  end
end


class Set < Menu
  def initialize
    super('SetMenu')
    @sub_items = []
    add_sub_item(Burger.new)
    add_sub_item(FrenchFly.new)
    add_sub_item(Drink.new)
  end

  def add_sub_item(item)
    @sub_items << item
  end

  def remove_sub_item(item)
    @sub_items.delete(item)
  end

  def get_price
    @sub_items.inject(0.0) { |sum, i| sum + i.get_price  }
  end
end


class ShoppingCart < Menu
  def initialize
    super('ShoppingCart')
    @items = []
  end

  def add_item item
    @items << item
  end

  def remove_item item
    @items.delete(item)
  end

  def items
    @items
  end

  def get_price
    @items.inject(0) { |sum, i| sum + i.get_price }
  end
end