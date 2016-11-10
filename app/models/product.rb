class Product < ActiveRecord::Base
	belongs_to :prod_category
	has_many :offers
	has_many :offer_items, through: :offers, source: :show_product
	translates :name, :desc, :props, :red_text

	def self.get_params_for_select
		Product.all.map do |product|
			[product.name, product.id]
		end
	end
end
