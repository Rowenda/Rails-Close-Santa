class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :event_adress, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
