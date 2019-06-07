class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items


  def self.create_order_num(num)
    "#{Time.now.year}#{padding_zero(Time.now.month, 2)}#{padding_zero(Time.now.day, 2)}#{padding_zero(num, 6)}"
  end
  
  private
  def self.padding_zero(num, digit)
    "#{'0' * 8}#{num}".chars.last(digit).join
  end
end
