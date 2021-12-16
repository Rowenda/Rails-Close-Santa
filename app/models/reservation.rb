class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :event_adress, presence: true
  validates :reservation_start, presence: true
  validates :reservation_end, presence: true
end
