class Vote < ApplicationRecord
  belongs_to :candidate, counter_cache: 'vote' # counter_cache 解決 n+1 效能問題
  belongs_to :user
end
