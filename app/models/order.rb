class Order < ApplicationRecord
  include AASM

  belongs_to :user

  has_many :books_orders
  has_many :books, through: :books_orders

  accepts_nested_attributes_for :books_orders, :allow_destroy => true

  aasm do
    state :created, initial: true
    state :shipped
    state :recieved

    event :ship do
      transitions from: [:created], to: :shipped
    end

    event :recieve do
      transitions from: [:shipped, :created], to: :recieved
    end

  end
end
