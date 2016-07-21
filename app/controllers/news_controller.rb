class NewsController < ApplicationController
  def index
  	@news = News.order(:created_at)
  end
  def show
  	@novelty = News.find(params[:id])
  	render json:@novelty
  end
  def edit
    @novelty = News.find(params[:id])
    render partial:'form', layout:false if params[:no_layout]
  end
  def new
    @novelty = News.new
    render partial:'form', layout:false if params[:no_layout]
  end

  def create
    data = news_params
    data[:img] =  uploadfile(params[:news][:img]) if params[:news][:img]
    @novelty = News.new(data)

    respond_to do |format|
      if @novelty.save
        format.html { redirect_to admin_news_index_url, notice: 'Novelty was successfully created.' }
      else
        format.html { redirect_to admin_news_index_url, error: 'Error.' }
        format.json { render json: @novelty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/sertificates/1
  # PATCH/PUT /admin/sertificates/1.json
  def update
    @novelty = News.find(params[:id])
    data = news_params
    if params[:news][:img] then
      old_filename = Rails.root.join("public", "images", @novelty.img)
      File.delete(old_filename) if File.exist? old_filename
      data[:img]  = uploadfile(params[:news][:img])
    end
    respond_to do |format|
      if @novelty.update(data)
        format.html { redirect_to admin_news_index_url, notice: 'Novelty was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @novelty.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def news_params
    params.require(:news).permit(:name, :desc, :img)
  end
end
