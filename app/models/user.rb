class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bookings
  has_many :products, through: :bookings
  validates :name, presence: true
  validates :address, presence: true
  validates :mail, uniqueness: true, presence: true
  validates :password, presence: true
end
