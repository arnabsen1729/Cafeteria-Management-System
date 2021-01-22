class UsersController < ApplicationController
  skip_before_action :ensure_logged_in

  def new
    render "users/new"
  end

  def create
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      role: "customer",
    )

    if new_user.save
      sessions[:current_user_id] = new_user.current_user_id
      redirect_to dashboard_path
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
