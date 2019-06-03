require 'rails_helper'



RSpec.describe Cart, type: :model do
  # before do
  #   @cart = Cart.new
  # end

  let(:cart) {Cart.new}

  describe '基本功能' do
    it '可以把商品丟到購物車裡，然後購物車裡就有東西了' do
      # cart = Cart.new #用 before 或 let 整理套用
      cart.add_item 1
      expect(cart.empty?).to be false
    end

    it '如果加了相同種類的商品到購物車裡，購買項目（Cart Item）並不會增加但商品的數量會改變' do
      # cart = Cart.new
      3.times {cart.add_item 1} #3次商品1
      2.times {cart.add_item 2} #2次商品2
      3.times {cart.add_item 1} #3次商品1
      expect(cart.items.count).to be 2 #共有2種商品
      expect(cart.items.first.quantity).to be 6 #商品1數量是6
    end

    it '商品可以放到購物車裡，也可以再拿出來' do
      p1 = create(:product)  #-> FactoryBot shorthand p1 = FactoryBot.create(:product)
      p2 = create(:product)  #-> FactoryBot shorthand p2 = FactoryBot.create(:product)

      2.times {cart.add_item(p1.id)}
      3.times {cart.add_item(p2.id)}

      expect(cart.items.first.product).to be_a Product # be_a 是一個xx
      expect(cart.items.first.product.title).to eq p1.title
    end

    it '可以計算整台購物車的總消費金額' do
      p1 = create(:product, price: 100)
      p2 = create(:product, price: 50)

      2.times {cart.add_item(p1.id)}
      3.times {cart.add_item(p2.id)}

      expect(cart.total_price).to eq 350
    end

    it '聖誕節的時候全面打 9 折' do
      
      t = Time.local(2020, 12, 25, 10, 5, 0) #timecop 調整日期至2020/12/25
      Timecop.travel(t)

      p1 = create(:product, price: 100)
      p2 = create(:product, price: 50)

      2.times {cart.add_item(p1.id)}
      3.times {cart.add_item(p2.id)}

      expect(cart.total_price).to eq 315
    end
  end

  describe '進階功能' do
    it '可以將購物車內容轉換成 Hash 並存到 Session 裡' do
    p1 = create(:product)
    p2 = create(:product)

    3.times {cart.add_item(p1.id)}
    5.times {cart.add_item(p2.id)}

    expect(cart.serialize).to eq session_hash
    end
  
    it "也可以存放在 Session 的內容（Hash 格式），還原成購物車的內容。" do
      cart = Cart.from_hash(session_hash)

      expect(cart.items.first.quantity).to be 3
      expect(cart.items.last.product_id).to be 2
    end
  end

  private
  def session_hash
    return {
      items: [
        { product_id: 1, quantity: 3},
        { product_id: 2, quantity: 5}
      ]
    }
  end
end
