class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :photo, PhotoUploader
  has_many :bookings, dependent: :destroy
  has_many :products, through: :bookings, dependent: :destroy
  has_many :products, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
end

