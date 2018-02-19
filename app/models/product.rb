class Product < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :tite, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :rent, default: :false
end