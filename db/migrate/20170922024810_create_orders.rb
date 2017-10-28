class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :username
      t.string :product
      t.string :price

      t.timestamps
    end
  end
end
