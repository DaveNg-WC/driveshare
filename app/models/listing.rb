class Listing < ApplicationRecord
  geocoded_by :address # telling Geocoder to geocode address field
  after_validation :geocode, if: :will_save_changes_to_address? # telling Geocoder to geocode only when changes made to address
  has_many :offers, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :address, presence: true
  has_one_attached :photo
end
