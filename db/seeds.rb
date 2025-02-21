book = Book.create(name: 'Dom Casmurro', price: 24.99)
book2 = Book.create(name: 'Bras Cubas', price: 19.45)
book3 = Book.create(name: 'The Alienist', price: 18.05)
10.times do
  book.sells.create(quantity: rand(2..15), day: Sell::DAYS.sample)
end

10.times do
  book2.sells.create(quantity: rand(2..15), day: Sell::DAYS.sample)
end

10.times do
  book3.sells.create(quantity: rand(2..15), day: Sell::DAYS.sample)
end
