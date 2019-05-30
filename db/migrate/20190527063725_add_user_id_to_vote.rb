class AddUserIdToVote < ActiveRecord::Migration[5.2]
  def change
    add_reference :votes, :user, index: true #此寫法是查rails add_column references得到
    # add_column(table_name, column_name, type, option={ })
  end
end
