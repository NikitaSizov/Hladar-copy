class Admin::OffersController < ApplicationController

  before_action :set_product

  def create
    offer = Offer.new product_id: @product.id, show_product_id: params[:show_product_id]
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
   def destroy
     offer = Offer.find params[:id]
     respond_to do |format|
       if offer.destroy then
         format.html { redirect_to admin_product_path(@product), notice: "Offer deleted" }
         format.json { render plain: "Deleted" }
       else
         format.html { redirect_to admin_product_path(@product), error: "An error occurred" }
         format.json { render json: "Error" }
       end
     end

    end
   def form
     @url = admin_product_offers_path(@product, format: :json)
     render partial: 'products/offer', locals: {offer: Offer.new(product_id: @product.id)}, layout: false
   end
   def set_product
     @product = Product.find params[:product_id]
   end
   def offer_params
    {
      product_id: params[:product_id],
      show_product_id: params[:show_product_id]
    }
   end
end
