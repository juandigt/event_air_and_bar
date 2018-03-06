class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users,  through: :bookings
  validates :description, presence: true
  validates :address, presence: true
  validates :capacity, presence: true
  validates :price, presence: true

end
