class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :restuarant_name, null: false
      t.string :OCR_text, null: false
      t.integer :creator_id

      t.timestamps null:false
    end
  end
end
