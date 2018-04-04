class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.float :total_price
      t.float :sub_total
      t.float :gst
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
