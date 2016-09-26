class RenameMenuColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :menus, :restuarant_name, :restaurant_name
    rename_column :menus, :OCR_text, :ocr_text
    change_column_null :menus, :ocr_text, false
  end
end
