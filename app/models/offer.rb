class Offer < ActiveRecord::Base
  belongs_to :product
  belongs_to :show_product, class_name: 'Product', foreign_key: 'show_product_id'
end
