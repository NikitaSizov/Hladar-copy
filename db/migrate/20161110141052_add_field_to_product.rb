class AddFieldToProduct < ActiveRecord::Migration

  def change
    add_column :products, :red_text, :text
    Product.add_translation_fields! red_text: :text
  end
end
