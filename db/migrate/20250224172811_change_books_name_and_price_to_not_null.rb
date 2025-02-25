class ChangeBooksNameAndPriceToNotNull < ActiveRecord::Migration[8.0]
  def change
    change_column_null :books, :name, false
    change_column_null :books, :price, false
  end
end
