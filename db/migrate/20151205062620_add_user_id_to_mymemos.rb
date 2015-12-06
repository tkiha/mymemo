class AddUserIdToMymemos < ActiveRecord::Migration
  def change
    add_column :mymemos, :user_id, :integer
  end
end
