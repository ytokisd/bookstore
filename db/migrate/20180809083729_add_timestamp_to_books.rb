class AddTimestampToBooks < ActiveRecord::Migration[5.2]
  def change_table
      add_column :books, :created_at, :datetime, null: false
      add_column :books, :updated_at, :datetime, null: false
    end
end
