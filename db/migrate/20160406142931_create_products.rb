class CreateProducts < ActiveRecord::Migration

  def up
  end

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
    Product.create_translation_table! name: :string, desc: :text, props: :text
  end

  def down
    Product.drop_translation_table!
  end
end
