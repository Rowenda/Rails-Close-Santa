class User < ApplicationRecord
  has_many :reservations
  has_many :offers
  validates :firstname, presence: true
  validates :lastname, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

         # a tester validates first and last name
end
