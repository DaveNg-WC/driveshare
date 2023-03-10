class OffersController < ApplicationController
  def index
    @offers = Offer.all
    # @user_offers = Offer.where(user_id: 1)
  end

  def new
    @offer = Offer.new
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @offer = Offer.new(price: params[:price], start_date: params[:start_date], end_date: params[:end_date])
    @offer.listing = @listing
    @offer.user = current_user

    if @offer.save
      redirect_to @listing, notice: "Offer sent successfully."
    else
      render 'new'
    end
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.status = "PROPOSAL"

    if @offer.update(offer_params)
      redirect_to offer_path, alert: "The counter-offer has been sent!"
    else
      render :edit
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    redirect_to listings_path, notice: "Offer was successfully deleted."
  end

  def accept_offer
    @offer = Offer.find(params[:id])
    @offer.status = "CONFIRMED"
    @offer.save
    redirect_to offer_path, alert: "You have accepted an offer. Status has changed from Proposal to Confirmed."
  end

  private

  def offer_params
    params.require(:offer).permit(:price, :start_date, :end_date)
  end
end
