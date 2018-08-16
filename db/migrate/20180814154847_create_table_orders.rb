class CreateTableOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :table_orders do |t|
      t.integer :order_number
      t.integer :user_id
      t.decimal :summary
      t.string :billing_address
      t.string :aasm_state
    end
  end
end
