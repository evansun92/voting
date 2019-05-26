class RemoveVoteToCandidate < ActiveRecord::Migration[5.2]
  def change
    remove_column :candidates, :vote, :integer, default: 0
  end
end
