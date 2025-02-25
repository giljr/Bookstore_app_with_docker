module SellsHelper
    def sells_per_day
        array = Array.new

        Date::DAYNAMES.each_with_index do |day, index|
            quantity = Sell.where("EXTRACT(DOW FROM sold_at) = ?", index).sum(:quantity)
            array.push([day, quantity])
        end

        array
    end

    def revenue_from_sells
        array = Array.new

        Book.all.each do |book|
            array.push([book.name, book.sells.sum(:total).round(2)])
        end

        array
    end

  
      def sales_by_day_of_week
        Sell.group("EXTRACT(DOW FROM sold_at)").sum(:total)
      end
    
      def quantity_by_day_of_week
        Sell.group("EXTRACT(DOW FROM sold_at)").sum(:quantity)
      end
    
      def sorted_sales_data
        days_order = [0, 1, 2, 3, 4, 5, 6] # Sunday (0) → Monday (1)
        sales_by_day_of_week.sort_by { |day, _| days_order.index(day.to_i) }
      end

end
