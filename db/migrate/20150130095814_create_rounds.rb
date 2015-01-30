class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :user_id
      t.

      t.timestamps null: false
    end
  end
end
