class AddReviewsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :staus_id
      t.string :title
      t.string :review_text
      t.datetime :created_at
    end
  end
end
