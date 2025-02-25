class AddSoldAtToSells < ActiveRecord::Migration[8.0]
  def change
    add_column :sells, :sold_at, :datetime
    remove_column :sells, :day, :string # Remove old column
  end
end
