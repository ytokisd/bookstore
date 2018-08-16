class BooksCategory < ApplicationRecord
  self.primary_key = 'id'
  belongs_to :book
  belongs_to :category
end
