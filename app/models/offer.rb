class Offer < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :title, presence: true
  validates :availability, presence: true
  validates :location, presence: true
  validates :price_per_hour, presence: true
  validates :offer_description, presence: true, length: { minimum: 30 }
  validates :santa_description, presence: true, length: { minimum: 30 }
end
