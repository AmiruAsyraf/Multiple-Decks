class CreateGuesess < ActiveRecord::Migration
  def change
    create_table :gues do |t|
      t.integer :guesses

      t.timestamps null: false
    end
  end
end
