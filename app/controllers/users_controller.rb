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
      session[:current_user_id] = new_user.id
      redirect_to dashboard_path
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def add
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      role: "customer",
    )
    if new_user.save
      redirect_to manage_users_path
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to manage_users_path
    end
  end

  def update
    id = params[:id]
    new_role = params[:role]
    User.update(id, role: new_role)
    redirect_to manage_users_path
  end

  def destroy
    User.delete(params[:id])
    redirect_to manage_users_path
  end
end
