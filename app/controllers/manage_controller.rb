class ManageController < ApplicationController
  before_action :ensure_owner

  def users
    render plain: "Mange Users"
  end

  def menus
    render plain: "Manage Menus"
  end

  def reports
    render plain: "Manage report"
  end
end
