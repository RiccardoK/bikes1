class ChangePriceTypeInOrders < ActiveRecord::Migration[5.1]
  def change
  	change_column :orders, :price, :integer
  end
end
