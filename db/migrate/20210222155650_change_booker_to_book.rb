class ChangeBookerToBook < ActiveRecord::Migration[6.1]
  def change
    rename_table :bookers, :books
  end
end
