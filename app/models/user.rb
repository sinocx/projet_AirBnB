class User < ApplicationRecord
  has_many :bookings
  has_many :products, through: :bookings
  validates :name, presence: true
  validates :address, presence: true
  validates :mail, uniqueness: true, presence: true, format: { with: /\A.*@.*\.com\z/ }
  validates :password, presence: true
end
