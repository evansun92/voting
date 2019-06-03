require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:cart) {Cart.new}
  # pending "add some examples to (or delete) #{__FILE__}"
  it '每個 Cart Item 都可以計算自己的金額（小計)' do
    p1 = create(:product, price: 100) #給固定金額才能 eq expect
    p2 = create(:product, price: 50)

    3.times {cart.add_item(p1.id)}
    2.times {cart.add_item(p2.id)}

    expect(cart.items.first.total_price).to eq 300
    expect(cart.items.last.total_price).to eq 100
  end
end
