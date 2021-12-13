class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :event_adress
      t.string :status
      t.time :start_time
      t.time :end_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
