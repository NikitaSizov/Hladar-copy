class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order.product, notice: 'Ваш запрос будет прочтен в ближайшее время.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { redirect_to @order.product, error: 'Что-то пошло не так.' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :product_id)
  end
end
