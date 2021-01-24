class ShopController < ApplicationController
  def index
    @menu_items = Menu.active_menu_items
    render "shop/index"
  end
end
