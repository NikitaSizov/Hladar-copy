class AboutMenu < ActiveRecord::Base
	belongs_to :product
	belongs_to :prod_category

	def self.getMenu
		products = Array.new
		categoryIds = select(:prod_category_id).order(:order)
		categories = Set.new
		categoryIds.each {|e|
			categories.add(e.prod_category_id)
		}
		categories.each {|cat|
			products.push where(prod_category_id: cat).order(:order)
		}
		return products
	end
end
