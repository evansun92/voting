class Product < ApplicationRecord #此model是 FactoryBot建product時建立的model
  acts_as_paranoid #paranoia
  # default_scope {where.not(default_at: nil)}
  
  validates :title, presence: true
  
  #用 scope (及lambda) 定義 controller 可使用的方法
  scope :available, -> {where(is_available: true)}
  scope :expensive_product, -> {where('price >= 80')}
  scope :good_product, -> {available.expensive_product}
  scope :price_over, -> (n){where('price >= #{n}')}

  # def self.available
  #   where(is_available: true)
  # end
end
