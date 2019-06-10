class Order < ApplicationRecord
  belongs_to :user
  validates :recipient, presence: true
  has_many :order_items


  include AASM

  aasm column: 'state' do
    state :pending, initial: true
    state :paid, :prepare, :delivered, :refunded, :cancelled

    event :cancel do
      transitions from: :pending, to: :cancelled
    end

    event :pay do
      transitions from: :pending, to: :paid
    end

    event :prepare do
      transitions from: :paid, to: :prepared
    end

    event :deliver do
      transitions from: :prepared, to: :delivered
      
      after do
      #發簡訊
      end
    end

    event :refund do
      transitions from: [:paid, :prepared, :delivered], to: :refunded
    end
  end

  def self.create_order_num(num)
    "#{Time.now.year}#{padding_zero(Time.now.month, 2)}#{padding_zero(Time.now.day, 2)}#{padding_zero(num, 6)}"
  end
  
  private
  def self.padding_zero(num, digit)
    "#{'0' * 8}#{num}".chars.last(digit).join
  end
end
