class Listing < ApplicationRecord
  has_many :offers, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :user
end
