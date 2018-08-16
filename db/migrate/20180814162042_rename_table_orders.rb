class RenameTableOrders < ActiveRecord::Migration[5.2]
  def change
    rename_table :table_orders, :orders
  end
end
