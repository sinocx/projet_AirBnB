class Product < ApplicationRecord
  CATEGORY = [ "skateboard", "vélo", "trottinette" ]

  belongs_to :user
  has_many :bookings

  validates :title, presence: true
  validates :category, inclusion: { in: CATEGORY }, presence: true
  validates :description, presence: true
  validates :price, presence: true

end
