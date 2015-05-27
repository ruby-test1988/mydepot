class StoreController < ApplicationController
  before_action :current_cart
  skip_before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def add_item
    line_item = @cart.add_item(params[:product_id])
    line_item.save

    redirect_to root_url
  end

  def destroy_cart
    @cart.destroy

    redirect_to root_url
  end
end
