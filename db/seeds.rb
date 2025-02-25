# Clear existing data
Sell.delete_all

# Get books to associate sales
books = Book.all
if books.empty?
  puts "No books found. Please create some books first."
  exit
end

# Generate sales for the current month
start_date = Date.today.beginning_of_month
end_date = Date.today.end_of_month

(start_date..end_date).each do |date|
  5.times do
    book = books.sample
    quantity = rand(1..5)
    total = quantity * book.price

    Sell.create!(
      book: book,
      quantity: quantity,
      total: total,
      sold_at: date
    )
  end
end

puts "Sales data for the current month has been seeded!"
