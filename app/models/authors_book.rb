class AuthorsBook < ApplicationRecord
  self.primary_key = 'id'
  belongs_to :author
  belongs_to :book
end
