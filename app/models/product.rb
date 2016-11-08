class Product < ActiveRecord::Base
	belongs_to :prod_category
	has_many :offers
	has_many :offer_items, through: :offers, source: :show_product
	translates :name, :desc, :props
end
