class PagesController < ApplicationController
  # whitelisting home page
  skip_before_action :authenticate_user!, only: :home

  def home
    @listings = Listing.limit(6)
  end

  def my_listings
    @listings = current_user.listings
  end

  def my_offers
    @my_offers = current_user.offers
  end
end
