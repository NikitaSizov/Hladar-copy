class Admin::ProductCategoriesController < ApplicationController

  def index
    @categories = ProdCategory.all
  end

  def update
    @category = ProdCategory.find(params[:id])
    data = category_params
    if params[:prod_category][:image] then
      if(@category.image) then
        old_filename = Rails.root.join("public", "images", @category.image)
        File.delete(old_filename) if File.exist? old_filename
      end
      data[:image]  = uploadfile(params[:prod_category][:image])
    end
    respond_to do |format|
      if @category.update(data)
        format.html { redirect_to admin_categories_path, notice: 'Данные категории изменены.' }
        format.json { render :index, status: :ok }
      else
        format.html { render :index }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    ProdCategory.find(params[:id]).delete
    redirect_to admin_categories_path
  end

  def new
    @category = ProdCategory.new
  end

  def create
    data = category_params
    data[:image] =  uploadfile(params[:prod_category][:image]) if params[:prod_category][:image]
    @category = ProdCategory.new(data)

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_path, notice: 'Sertificate was successfully created.' }
      else
        format.html { render :index }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def category_params
    params.require(:prod_category).permit(:name, :description, :show_on_main)
  end
end
