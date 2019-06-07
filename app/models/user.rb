class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :votes
  has_many :candidates, through: :votes #透過 :votes多對多中間的table

  has_many :orders
  
  def admin?
    role == 'admin'
  end
end
