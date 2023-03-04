class ReviewsController < ApplicationController
  before_action :set_listing, only: %i[new create index]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.listing = @listing
    @review.user = current_user
    @listing.user == current_user ? @review.for_host = false : @review.for_host = true

    # to validate if review if valid
    if @review.save
      redirect_to listing_path(@listing)

    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @reviews = @listing.reviews
  end

  def destroy
    @review = Review.find(params[:id])
    listing = @review.listing
    @review.destroy
    redirect_to listing_reviews_path(listing)
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
