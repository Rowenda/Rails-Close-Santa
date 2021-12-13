class Reservation < ApplicationRecord
  belongs_to :user_id
  belongs_to :offer_id
end
