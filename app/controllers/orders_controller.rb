class OrdersController < ApplicationController
  before_action :ensure_clerk_owner, only: [:index, :show, :update]

  def index
    @pending_orders = Order.pending
    @delivered_orders = Order.delivered
    render "orders/index"
  end

  def create
    cart_items = Cart.get_items(session[:cart])
    new_order = {}

    if cart_items.size == 0
      flash[:info] = "Order can't be placed, cart is empty !!"
      redirect_to shop_path
    else
      if current_user.role == "clerk"
        new_order[:user_id] = User.getWalkInCustomerId
      else
        new_order[:user_id] = session[:current_user_id]
      end

      new_order[:date] = Date.today
      new_order[:delivered_at] = nil

      new_order_id = Order.create!(new_order).id
      Order.add_items(cart_items, new_order_id)
      session[:cart] = nil
      flash[:success] = "Your Order was placed successfully!! Order Id: #{new_order_id}"
      redirect_to shop_path
    end
  end

  def show
    id = params[:id]
    @order = Order.find_by_id(id)
    @user = @order.get_user
    render "orders/show"
  end

  def update
    id = params[:id]
    Order.update(id, delivered_at: Date.today)
    redirect_to orders_path
  end
end
