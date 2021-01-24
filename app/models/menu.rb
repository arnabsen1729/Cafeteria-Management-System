class Menu < ApplicationRecord
  has_many :menu_items, :dependent => :destroy

  def self.active_menu
    Menu.find_by(is_active: true)
  end

  def self.active_menu_id
    Menu.active_menu.id
  end

  def self.active_menu_items
    Menu.active_menu.menu_items
  end

  def self.all_ids
    Menu.all.map { |menu| menu.id }
  end
end
