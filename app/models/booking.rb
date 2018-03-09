class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  validates :date, presence: true
  enum status: [ :pending, :approved, :declined ]
end
