class CreateProdCategories < ActiveRecord::Migration
  def up
  end
  def change
    create_table :prod_categories do |t|
      t.string :name
      t.text :description
      t.boolean :show_on_main
      t.string :image
      t.timestamps null: false
    end
    ProdCategory.create_translation_table! name: :string, description: :text
  end
  def down
    ProdCategory.drop_translation_table!
  end
end
