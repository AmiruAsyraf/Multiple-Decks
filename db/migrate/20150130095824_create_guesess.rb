class CreateGuesess < ActiveRecord::Migration
  def change
    create_table :gues do |t|
      t.string :status, default: "false"
      t.integer :card_id

      t.timestamps null: false
    end
  end
end
