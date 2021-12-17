class Car < ApplicationRecord
  CATEGORY = ["Sportscar", "City Car", "Sedan", "All Natural", "Supercar", "SUV"]
  TRANSMISION = ["Automatic", "Manual", "Assisted"]
  ENERGY = ["Petrol", "Diesel", "Electrical", "Hybrid", "Renewable"]

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY,
    message: "%{value} is not a valid category" }
  validates :transmision, presence: true, inclusion: { in: TRANSMISION,
    message: "%{value} is not a valid transmission type" }
  validates :energy, presence: true, inclusion: { in: ENERGY,
    message: "%{value} is not a valid fuel type" }
  validates :city, presence: true
  validates :price_per_day, presence: true, numericality: { greater_than: 0 }

  include PgSearch::Model
  pg_search_scope :search_by_name_and_category_city,
    against: [ :name, :category, :city, :transmision, :energy ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  pg_search_scope :search_by_name,
    against: [ :name],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  pg_search_scope :search_by_category,
    against: [ :category],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  pg_search_scope :search_by_energy,
    against: [ :energy],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  pg_search_scope :search_by_transmision,
    against: [ :transmision],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  pg_search_scope :search_by_city,
    against: [ :city],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  # scope :filter_by_name, -> (name) { where("name ILIKE ?", "%#{name}%")}
  # scope :filter_by_category, -> (category) { where("category = ?", category)}
  # scope :filter_by_transmision, -> (transmision) { where("transmision = ?", transmision) }
  # scope :filter_by_energy, -> (energy) { where("energy = ?", energy) }
  # scope :filter_by_max_price, -> (max_price) { where(price_per_day: "<= #{max_price}") }

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
end
