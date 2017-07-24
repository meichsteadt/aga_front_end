class ProductsController < ApplicationController

  def index
    @products = Product.get_products(params[:category_id])
    @category = params[:category_id]
    if !params[:page]
      @page = 1
    else
      @page = params[:page]
    end
  end

  def show
    @product = Product.get_product(params[:id])
    @category = @product.category
    @page = params[:page]
    @sum = 0
    @multiplier = @user["user"][@category + "_mult"]
    if params[:sum]
      @product.product_items.each do |item|
        @sum = @sum + params[item['number']].to_i * item['price'].to_i * @multiplier
        params[:current_total] = @sum
      end
      respond_to do |format|
        format.html { redirect_to product_path(@product.number, category: @category) }
        format.js
      end
    end
  end
end
