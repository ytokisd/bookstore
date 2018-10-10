class RenameTableCoupon < ActiveRecord::Migration[5.2]
  def change
    rename_table :coupon, :coupons
  end
end
