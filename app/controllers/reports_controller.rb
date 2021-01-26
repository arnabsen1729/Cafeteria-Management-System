class ReportsController < ApplicationController
  def index
    @from_date = params[:from_date]
    @to_date = params[:to_date]
    @orders = Order.delivered.range(@from_date, @to_date)
    @total_price = @orders.map { |order| order.get_price }.sum
    render "reports/index"
  end

  def user
    id = params[:id]
    @user = User.find_by_id(id)
    @from_date = params[:from_date]
    @to_date = params[:to_date]
    @orders = @user.orders.delivered.range(@from_date, @to_date)
    @total_price = @orders.map { |order| order.get_price }.sum
    render "reports/user"
  end
end
