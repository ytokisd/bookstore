class AddAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.first_name
      t.last_name
      t.biography
    end
  end
end
