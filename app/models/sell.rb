class Sell < ApplicationRecord
  belongs_to :book
  validates :quantity, presence: true
  validates :day, presence: true

  after_create :set_total

  after_create_commit :update_charts

  DAYS = %w[MONDAY TUESDAY WEDNESDAY THURSDAY FRIDAY SATURDAY SUNDAY].freeze

  private

  def set_total
    revenue = self.quantity * self.book.price
    self.update(total: revenue)
  end

  def update_charts
    broadcast_replace_to('sells_charts_channel', partial: '/dashboard/charts/days/chart', locals: {}, target: 'days_chart')
    broadcast_replace_to('sells_charts_channel', partial: '/dashboard/charts/revenue/chart',  locals: {}, target: 'revenue_chart')
    broadcast_replace_to('sells_charts_channel', partial: '/dashboard/charts/books/chart', locals: { book: book }, target: "book_#{book.id}")
  end
  
end
