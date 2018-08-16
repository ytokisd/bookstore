class CreateJoinTableBookOrder < ActiveRecord::Migration[5.2]
  def change
    create_join_table :books, :orders do |t|
      t.index [:book_id, :order_id]
    end
  end
end
