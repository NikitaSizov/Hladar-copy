class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :product_id
      t.integer :show_product_id

      t.timestamps null: false
    end
  end
end
