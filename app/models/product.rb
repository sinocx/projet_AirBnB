class Product < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  CATEGORY = [ "skateboard", "vélo", "trottinette" ]
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings

  validates :title, presence: true
  validates :category, inclusion: { in: CATEGORY }, presence: true
  validates :description, presence: true
  validates :price, presence: true

end
