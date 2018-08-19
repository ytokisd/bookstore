class Order < ApplicationRecord
  include AASM

  has_one :user

  has_many :books_orders
  has_many :books, through: :books_orders

  before_save :update_summary
  before_create :update_status

  def calculate_total
    self.books_orders.collect { |item| item.book.price * item.quantity }.sum
  end

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

  private

  def update_status
    if self.aasm_state == nil?
      self.aasm_state = "In progress"
    end
  end

  def update_summary
    self.summary = calculate_total
  end
end
