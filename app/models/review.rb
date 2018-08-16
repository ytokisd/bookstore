class Review < ApplicationRecord
  belongs_to :status
  belongs_to :book
  belongs_to :user

  accepts_nested_attributes_for :status
  accepts_nested_attributes_for :book
  accepts_nested_attributes_for :user
end
