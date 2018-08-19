class AddQuantityToBookOrders < ActiveRecord::Migration[5.2]
  def change
    change_table :books_orders do |t|
      t.integer :quantity
    end
  end
end
