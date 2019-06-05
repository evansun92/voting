class Cart
  attr_reader :items
  def initialize(items = [])
    @items = items #陣列裝商品
  end
  
  def add_item(product_id)
    # 商品是否存在
    found_item = @items.find {|item| item.product_id == product_id}
    # 如果找到則商品數量+1,沒找到則加新商品到[]
    if found_item
      found_item.increment
    else
      @items << CartItem.new(product_id)
    end
  end

  def empty?
    @items.empty?
  end

  # def items
  #  @items    #attr_reader取代
  # end

  def total_price
    # total = 0
    # @items.each do |item|
    #   total += item.total_price
    # end
    # total

    total = @items.reduce(0) {|sum, item| sum + item.total_price} #reduce(0) -> 初始值是0
    
    if xmas? #在下面設private
      total *= 0.9
    else
      total
    end
  end

  def serialize
    # result = [
    #   {product_id: 1, quantity: 3},
    #   {product_id: 2, quantity: 5}
    # ]

    result = items.map{ |item|
      {'product_id' => item.product_id, 'quantity' => item.quantity}
    }

    return {'items' => result}
  end

  def self.from_hash(hash = nil)
    if hash && hash['items']
      #重組
      #組出充滿 CartItem 的陣列
      all_items = hash['items'].map { |item|
      CartItem.new(item['product_id'], item['quantity']) #cart_item.rb
    }
    Cart.new(all_items)
    else
      #新購物車
      Cart.new
    end
  end

  private

  def xmas?
    Time.now.month == 12 && Time.now.day == 25
  end
end