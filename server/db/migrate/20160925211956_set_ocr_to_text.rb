class SetOcrToText < ActiveRecord::Migration[5.0]
  def change
    change_column :menus, :ocr_text, :text
  end
end
