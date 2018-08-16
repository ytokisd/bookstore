class AddPriceTopBooks < ActiveRecord::Migration[5.2]
  def change
    change_table :books do |t|
      t.decimal :price
    end
  end
end
