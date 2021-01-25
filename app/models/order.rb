class Order < ApplicationRecord
  has_many :order_items, :dependent => :destroy

  def self.add_items(items, order_id)
    items.each do |item|
      OrderItem.create!(
        order_id: order_id,
        menu_item_id: item[:id],
        menu_item_name: item[:name],
        menu_item_qty: item[:qty],
        menu_item_price: item[:price],
      )
    end
  end

  def self.pending
    Order.where(delivered_at: nil)
  end

  def self.delivered
    Order.where.not(delivered_at: nil)
  end

  def get_user
    User.find_by_id(self.user_id)
  end

  def get_userfullname
    self.get_user.get_fullname
  end

  def get_price
    self.order_items.map { |item| item[:menu_item_qty] * item[:menu_item_price] }.sum
  end

  def self.range(from_date, to_date)
    # binding.pry
    from_date = nil if from_date == ""
    to_date = nil if to_date == ""
    if from_date and to_date
      Order.where(["date >= ? and date <= ?", from_date, to_date])
    elsif from_date
      Order.where(["date >= ?", from_date])
    elsif to_date
      Order.where(["date <= ?", to_date])
    else
      Order.all
    end
  end
end
