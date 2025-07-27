class CreateGroceryLists < ActiveRecord::Migration[8.0]
  def change
    create_table :grocery_lists do |t|
      t.references :daily_menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
