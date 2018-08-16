class RemoveIdColumnFromAuthorsBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column(:authors_books, :id)
  end
end
