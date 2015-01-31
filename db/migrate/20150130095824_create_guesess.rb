class CreateGuesess < ActiveRecord::Migration
  def change
    create_table :gues do |t|
      t.integer :correct, default: 0
      t.integer :wrong, default: 0
      t.integer :round_id

      t.timestamps null: false
    end
  end
end
