class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :image
      t.decimal :price
      t.integer :stock_status
      t.integer :visibility
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
