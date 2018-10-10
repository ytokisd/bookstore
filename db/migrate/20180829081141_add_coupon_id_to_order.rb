class AddCouponIdToOrder < ActiveRecord::Migration[5.2]
  def change
    change_table :orders do |t|
      t.integer :coupon_id
    end
  end
end
