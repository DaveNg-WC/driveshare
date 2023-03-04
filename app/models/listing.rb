class Listing < ApplicationRecord
  has_many :offers, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :address, presence: true
  has_many_attached :photo
end
