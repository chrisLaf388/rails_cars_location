class Car < ApplicationRecord
  CATEGORY = ["Sportscar", "City Car", "Sedan", "All Natural", "Supercar", "SUV"]

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY,
    message: "%{value} is not a valid category" }
  validates :city, presence: true
  validates :price_per_day, presence: true, numericality: { greater_than: 0 }

  include PgSearch::Model
  pg_search_scope :search_by_name_and_category_city,
    against: [ :name, :category, :city ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
