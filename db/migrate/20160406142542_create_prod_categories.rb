class CreateProdCategories < ActiveRecord::Migration
  def change
    create_table :prod_categories do |t|
      t.string :name
      t.text :description
      t.boolean :show_on_main
      t.string :image
      t.timestamps null: false
    end
  end
end
