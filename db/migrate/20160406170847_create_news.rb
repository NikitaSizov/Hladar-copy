class CreateNews < ActiveRecord::Migration

  def up
  end
  def change
    create_table :news do |t|
      t.string :name
      t.text :desc
      t.string :img

      t.timestamps null: false
    end
    News.create_translation_table! name: :string, desc: :text
  end
  def down
    News.drop_translation_table!
  end
end
