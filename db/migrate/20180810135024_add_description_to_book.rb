class AddDescriptionToBook < ActiveRecord::Migration[5.2]
  def change
    change_table :books do |t|
      t.string :description
    end
  end
end
