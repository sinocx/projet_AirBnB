class Product < ApplicationRecord
  CATEGORY = [ "skateboard", "vélo", "trottinette" ]

  belongs_to :user
  has_many :bookings

  validates :title, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY }
  validates :description, presence: true
  validates :price, presence: true

end
