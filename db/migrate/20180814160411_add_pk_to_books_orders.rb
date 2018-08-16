class AddPkToBooksOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :books_orders, :id, :primary_key
  end
end
