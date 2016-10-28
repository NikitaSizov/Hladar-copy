class Product < ActiveRecord::Base
	belongs_to :prod_category
	translates :name, :desc, :props
end
