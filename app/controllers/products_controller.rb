class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_categories
  # GET /products
  # GET /products.json
  def index
    @product = Product.first
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @order = Order.new
    render layout: false if params[:no_layout]
  end

  # GET /products/new
  def new
    @product = Product.new
    render layout: false if params[:no_layout]
  end

  # GET /products/1/edit
  def edit
    render layout: false if params[:no_layout]
  end

  # POST /products
  # POST /products.json
  def create
    data = product_params
    data[:img] =  uploadfile(params[:product][:img]) if params[:product][:img]
    data[:prod_category] = ProdCategory.find data[:prod_category]
    @product = Product.new(data)

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_path(@product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    data = product_params
    if params[:product][:img] then
      old_filename = Rails.root.join("public", "images", @product.img)
      File.delete(old_filename) if File.exist? old_filename
      filename = uploadfile(params[:product][:img])
      logger.error filename
      data[:img] = filename
    end
    data[:prod_category] = ProdCategory.find data[:prod_category]
    respond_to do |format|
      if @product.update(data)
        format.html { redirect_to admin_product_path(@product), notice: 'Данные продукта изменены.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
    def set_categories
      @categories = ProdCategory.all
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :desc, :img, :price, :quantity, :props, :prod_category)
    end
end
