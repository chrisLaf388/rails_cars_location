class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  
  validates :name, presence: true
  validates :category, presence: true
  validates :city, presence: true
  validates :price_per_day, presence: true, numericality: { greater_than: 0 }
end
