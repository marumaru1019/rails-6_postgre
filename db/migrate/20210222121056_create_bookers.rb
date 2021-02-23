class CreateBookers < ActiveRecord::Migration[6.1]
  def change
    create_table :bookers do |t|
      t.text :title
      t.text :body
      t.timestamps
    end
  end
end
