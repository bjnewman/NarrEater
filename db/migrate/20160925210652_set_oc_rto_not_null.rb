class SetOcRtoNotNull < ActiveRecord::Migration[5.0]
  def change
    change_column_null :menus, :ocr_text, true
  end
end
