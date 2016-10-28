class ProdCategory < ActiveRecord::Base
	has_many :product
	translates :name, :description
end
