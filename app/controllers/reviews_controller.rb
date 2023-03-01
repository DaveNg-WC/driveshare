class ReviewsController < ApplicationController
  before_action :set_listing, only: %i[new create]

  def new
    @listing = set_listing
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.listing = set_listing
    @review.user = current_user
    # to validate if review if valid
    if @review.save
      redirect_to listing_path(@listing)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @reviews = Review.all
  end


  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
