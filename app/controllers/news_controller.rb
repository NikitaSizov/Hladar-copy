class NewsController < ApplicationController
  def index
  	@news = News.order(:created_at)
  end
  def show
  	@novelty = News.find(params[:id])
  	render json:@novelty
  end
  def edit
    @news = News.find(params[:id])
  end
end
