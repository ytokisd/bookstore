class AddCoupona < ActiveRecord::Migration[5.2]
  def change
    create_table :coupon do |t|
      t.integer :code
      t.boolean :active, default: true
    end
  end
end
