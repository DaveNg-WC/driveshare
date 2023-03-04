class ReviewsController < ApplicationController
  before_action :set_listing, only: %i[new create destroy]

  def new
    @listing = set_listing
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.listing = set_listing
    @review.user = User.first
    set_listing.user == User.first ? @review.for_host = false : @review.for_host = true

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

  def destroy
    @review.destroy
    raise
    redirect_to index_path(@reviews), notice: "Review deleted successfully!"
  end


  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
