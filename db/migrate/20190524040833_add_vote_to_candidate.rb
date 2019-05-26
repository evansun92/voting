class AddVoteToCandidate < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :vote, :integer, default: 0
    # add_column(table_name, column_name, type, option={ })
  end
end
