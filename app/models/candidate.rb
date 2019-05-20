class Candidate < ApplicationRecord
    validates :name, presence: true #驗證 姓名 欄位必填
    validates_numericality_of :age, only_integer: true #驗證 年齡 欄位需是整數
end
