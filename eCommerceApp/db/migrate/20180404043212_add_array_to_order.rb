class AddArrayToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :order_items, :array
  end
end
