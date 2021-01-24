class HomeController < ApplicationController
  skip_before_action :ensure_logged_in

  def index
    if current_user
      redirect_to shop_path
    else
      render "home/index"
    end
  end
end
