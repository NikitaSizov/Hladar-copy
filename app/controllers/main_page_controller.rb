class MainPageController < ApplicationController
	def index
		@aboutMenu = AboutMenu.getMenu
		@news = News.order(:created_at).limit(3)
		@sertificates = Sertificate.all
		@categories = ProdCategory.where(show_on_main: true)
	end
	def smth
		render json: AboutMenu.getMenu

	end
end
