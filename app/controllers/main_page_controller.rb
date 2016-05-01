class MainPageController < ApplicationController
	def index
		@aboutMenu = AboutMenu.getMenu
		@news = News.order(:created_at).limit(3)
	end
	def smth
		render json: AboutMenu.getMenu

	end
end
