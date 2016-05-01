class CreateAboutMenus < ActiveRecord::Migration
  def change
    create_table :about_menus do |t|
      t.integer :product_id
      t.integer :prod_category_id
      t.integer :order

      t.timestamps null: false
    end
  end
end
