class Sell < ApplicationRecord
  belongs_to :book
  validates :quantity, presence: true
  validates :day, presence: true

  after_create :set_total

  DAYS = %w[MONDAY TUESDAY WEDNESDAY THURSDAY FRIDAY SATURDAY SUNDAY].freeze

  def set_total
    revenue = self.quantity * self.book.price
    self.update(total: revenue)
  end
end
