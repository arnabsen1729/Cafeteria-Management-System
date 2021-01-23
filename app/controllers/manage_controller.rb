class ManageController < ApplicationController
  before_action :ensure_owner

  def users
    render "manage/users"
  end

  def menus
    render plain: "Manage Menus"
  end

  def reports
    render plain: "Manage report"
  end
end
