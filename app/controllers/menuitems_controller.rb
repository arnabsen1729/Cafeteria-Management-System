class MenuitemsController < ApplicationController
  before_action :ensure_owner

  def new
    render "menuitems/new"
  end

  def create
    # binding.pry
    menu_item_params = params.permit(:menu_id, :name, :description, :price, :image)
    new_menu_item = MenuItem.create(menu_item_params)
    if new_menu_item.save
      redirect_to ""
    else
      render plain: new_menu_item.errors.full_messages
      # flash[:error] = new_menu_item.errors.full_messages

    end
  end
end
