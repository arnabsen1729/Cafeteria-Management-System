class SessionsController < ApplicationController
  skip_before_action :ensure_logged_in

  def new
    render "sessions/new"
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = "Your login attempt failed"
      redirect_to new_session_path
    end
  end
end
