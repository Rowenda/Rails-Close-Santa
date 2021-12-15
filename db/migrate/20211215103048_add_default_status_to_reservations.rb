class AddDefaultStatusToReservations < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:reservations, :status, from: nil, to: "pending")
  end
end
