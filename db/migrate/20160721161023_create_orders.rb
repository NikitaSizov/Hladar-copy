class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
