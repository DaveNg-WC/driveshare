class PagesController < ApplicationController
  # whitelisting home page
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def my_listings
    @my_listings = current_user.listings
  end
end
