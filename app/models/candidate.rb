class Candidate < ApplicationRecord
    validates :name, presence: true #驗證 姓名 欄位必填
    validates_numericality_of :age, greater_than_or_equal_to: 40 #驗證 年齡 必須≥40

    has_many :votes
    has_many :users, through: :votes #透過 :votes多對多中間的table
end
