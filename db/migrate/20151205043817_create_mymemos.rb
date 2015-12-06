class CreateMymemos < ActiveRecord::Migration
  def change
    create_table :mymemos do |t|
      t.string :title
      t.string :text
    end
  end
end
