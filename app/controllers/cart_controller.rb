class CartController < ApplicationController
  def add
    item = params.permit(:item_id, :item_qty)
    session[:cart] = Cart.add_item(session[:cart], item)
    redirect_to shop_path
  end

  def index
    @first_name = current_user.first_name
    @cart_items = Cart.get_items(session[:cart])
    @total_items = Cart.count(session[:cart])
    @total_price = Cart.get_price(@cart_items)
    render "cart/index"
  end

  def destroy
    item_id = params[:id]
    session[:cart] = Cart.remove_item(session[:cart], item_id)
    redirect_to cart_index_path
  end
end
