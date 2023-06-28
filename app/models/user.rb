class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :phone, presence: true

  has_one_attached :avatar

  has_many :addresses
  has_many :claims
  has_many :wish_items
  has_many :orders

  enum role: { user: 0, admin: 1 }
end
