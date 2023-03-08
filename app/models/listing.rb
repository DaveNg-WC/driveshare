class Listing < ApplicationRecord
  has_many :offers, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :user
  validates :brand, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :transmission, presence: true
  validates :category, presence: true
  has_one_attached :photo
end
