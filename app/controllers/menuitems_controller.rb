class MenuitemsController < ApplicationController
  before_action :ensure_owner

  def new
    @menu_id = params[:id]
    render "menuitems/new"
  end

  def create
    menu_item_params = params.permit(:menu_id, :name, :description, :price, :image)
    new_menu_item = MenuItem.new(menu_item_params)
    if new_menu_item.save
      redirect_to menu_path(menu_item_params[:menu_id])
    else
      flash[:error] = new_menu_item.errors.full_messages
      redirect_to menus_path
    end
  end

  def destroy
    menuitems_id = params[:id]
    menu_id = MenuItem.find_by_id(menuitems_id).menu.id
    MenuItem.destroy(menuitems_id)
    redirect_to menu_path(menu_id)
  end
end
