class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :desc
      t.string :img
      t.integer :price
      t.integer :quantity
      t.text :props
      t.integer :prod_category_id

      t.timestamps null: false
    end
  end
end
