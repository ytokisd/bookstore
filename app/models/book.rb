class Book < ApplicationRecord
  has_many :books_categories #join_table: :books_categories
  has_many :categories, through: :books_categories

  accepts_nested_attributes_for :books_categories, :allow_destroy => true

  has_many :books_orders
  has_many :orders, through: :books_orders

  accepts_nested_attributes_for :books_orders, :allow_destroy => true
  #accepts_nested_attributes_for :categories, :allow_destroy => true

  has_many :authors_books
  has_many :authors, through: :authors_books #join_table: :authors_books

  accepts_nested_attributes_for :authors_books, :allow_destroy => true
  #accepts_nested_attributes_for :authors, :allow_destroy => true
  mount_uploader :image, ImageUploader
end
