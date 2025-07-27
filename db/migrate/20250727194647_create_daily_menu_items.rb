class CreateDailyMenuItems < ActiveRecord::Migration[8.0]
  def change
    create_table :daily_menu_items do |t|
      t.string :name
      t.text :description
      t.string :category
      t.references :daily_menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
