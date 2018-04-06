class AddColumnToCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :user_choice, :integer
  end
end
