class MenusController < ApplicationController
  before_action :ensure_owner

  def index
    render "menus/index"
  end

  def create
    new_menu = Menu.new(name: params[:name], is_active: false)
    if new_menu.save
      redirect_to menus_path
    else
      flash[:error] = new_menu.errors.full_messages
      redirect_to menus_path
    end
  end

  def update
    Menu.update(params[:id], name: params[:name])
    redirect_to menu_path(params[:id])
  end

  def destroy
    Menu.delete(params[:id])
    redirect_to menus_path
  end

  def show
    @menu = Menu.find_by_id(params[:id])
    if @menu
      render "menus/show"
    else
      redirect_to menus_path
    end
  end

  def new
    render "menus/new"
  end

  def active
    active_menu_id = params[:menu_id]
    Menu.where(is_active: true).map { |menu| menu.update(is_active: false) }
    Menu.update(active_menu_id, is_active: true)
    redirect_to menus_path
  end
end
