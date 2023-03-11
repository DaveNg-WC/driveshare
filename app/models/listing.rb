class Listing < ApplicationRecord
  # geocoded_by :address # telling Geocoder to geocode address field
  # after_validation :geocode, if: :will_save_change_to_address? # telling Geocoder to geocode only when changes made to address
  # has_many :offers, dependent: :destroy
  # has_many :reviews, dependent: :destroy
  # belongs_to :user
  # validates :brand, presence: true
  # validates :description, presence: true
  # validates :price, presence: true
  # validates :address, presence: true
  # validates :transmission, presence: true
  # validates :category, presence: true
  # has_many_attached :photos



  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :offers, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :user
  validates_presence_of :brand, :description, :price, :address, :transmission, :category, :name
  has_many_attached :photos


end
