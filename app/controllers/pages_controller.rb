class PagesController < ApplicationController
  # whitelisting home page
  skip_before_action :authenticate_user!, only: :home

  def home
  end
end
