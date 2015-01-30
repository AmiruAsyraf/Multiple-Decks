class CreateCards < ActiveRecord::Migration
  def change
   create_table :cards do |t|
     t.text :question
     t.string :answer
     t.integer :deck_id

     t.timestamps null: false
   end
  end
end
