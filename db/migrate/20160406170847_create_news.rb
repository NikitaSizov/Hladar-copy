class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :name
      t.text :desc
      t.string :img

      t.timestamps null: false
    end
  end
end
