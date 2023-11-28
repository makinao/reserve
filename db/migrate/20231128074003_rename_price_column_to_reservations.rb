class RenamePriceColumnToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :price, :money
  end
end
