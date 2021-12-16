class ChangeReservationStartTimeAndEndTime < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :start_time, :reservation_start
    rename_column :reservations, :end_time, :reservation_end
  end
end
