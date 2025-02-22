class Book < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true

    has_many :sells

    after_create :create_chart

    private

    def create_chart    
        broadcast_append_to('books_charts_channel', partial: '/dashboard/charts/books/chart', locals: { book: self }, target: 'books_charts')
    end
end
