class Review < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  validates :rating, numericality: { only_float: true, message: "should be a number!" }
end
