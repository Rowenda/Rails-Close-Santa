class Offer < ApplicationRecord
  # belongs_to :users
  # has_many :reservations, dependent: :destroy
  validates :title, presence: true
  validates :availability, presence: true
  validates :location, presence: true
  validates :price_per_hour, presence: true
  validates :offer_description, presence: true, length: { minimum: 30 }
  validates :santa_description, presence: true, length: { minimum: 30 }
end
