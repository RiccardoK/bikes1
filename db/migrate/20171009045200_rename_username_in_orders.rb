class RenameUsernameInOrders < ActiveRecord::Migration[5.1]
  def change
  	rename_column :orders, :username, :name
  end
end
