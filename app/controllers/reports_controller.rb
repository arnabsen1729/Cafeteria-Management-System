class ReportsController < ApplicationController
  def index
    @from_date = params[:from_date]
    @to_date = params[:to_date]
    @orders = Order.delivered.range(@from_date, @to_date)
    render "reports/index"
  end

  def user
    id = params[:id]
    render plain: id
  end
end
