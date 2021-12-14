class Reservation < ApplicationRecord
  belongs_to :user_id
  belongs_to :offer_id
  validates :event_adress, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
