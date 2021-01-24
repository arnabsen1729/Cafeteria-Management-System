class Cart < ApplicationRecord
  def self.add_item(session_arr, item)
    session_arr ||= []
    session_arr.fill(item[:item_id].to_i, session_arr.size, item[:item_qty].to_i)
  end

  def self.count(session_arr)
    session_arr.size
  end

  def self.get_item(item_id)
    MenuItem.find_by_id(item_id)
  end

  def self.get_items(items)
    items_hash = []
    count_hash = items.each_with_object(Hash.new(0)) { |item, hash| hash[item] += 1 }
    count_hash.each do |item_id, count|
      item = Cart.get_item(item_id)
      items_hash.push({
        id: item.id,
        name: item.name,
        price: item.price,
        qty: count,
      })
    end
    items_hash
  end

  def self.remove_item(session_arr, item_id)
    session_arr.delete(item_id.to_i)
    session_arr
  end
end
