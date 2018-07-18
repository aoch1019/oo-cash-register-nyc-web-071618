class CashRegister

  attr_accessor :total
  attr_reader :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @transactions = []
  end

  def add_item(item, price, quantity = 1)
    @total += (price * quantity)
    quantity.times do
      @transactions.push({item => price})
    end
  end

  def apply_discount
    if discount == 0
      return "There is no discount to apply."
    end
    @total = (@total * (100-@discount))/100
    return "After the discount, the total comes to $#{@total}."
  end

  def items
    @transactions.map do |item_price_hash|
      item_price_hash.keys[0]
    end
  end

  def void_last_transaction
    @total -= @transactions.pop.values[0]
  end

end
