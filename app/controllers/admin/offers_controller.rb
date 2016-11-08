class Admin::OffersController < ApplicationController

  before_action :set_product

  def create
    offer = @product.build show_product_id: params[:show_product_id]
    respond_to do |format|
      if offer.save then
        format.html { redirect_to admin_product_path(@product), notice: "Offer saved" }
        format.json { render plain: "Created" }
      else
        format.html { redirect_to admin_product_path(@product), error: "An error occurred" }
        format.json { render json: "Error" }
      end
    end
  end
  def update
    offer = Offer.find params[:id]
    respond_to do |format|
      if offer.update offer_params then
        format.html { redirect_to admin_product_path(@product), notice: "Offer saved" }
        format.json { render plain: "Updated" }
      else
        format.html { redirect_to admin_product_path(@product), error: "An error occurred" }
        format.json { render json: "Error" }
      end
    end

   end

   def set_product
     @product = Product.find params[:product_id]
   end
   def offer_params
     params.permit :product_id, :show_product_id
   end
end
