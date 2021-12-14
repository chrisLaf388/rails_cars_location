class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :car, uniqueness: { scope: :user }
  # start_at < end_at
  validates :end_at, comparison: { greater_than: :start_at }
  # total_price > 0
  validates :total_price, numericality: { greater_than: 0 }
end
