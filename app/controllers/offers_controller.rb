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
    @offer = Offer.new(offer_params)
    # @offer.user_id = @CurrentUserLoggedIn.id
    # @offer.listing_id = params[:listing_id]

    if @offer.save
      # redirect_to specific_offer_page
    else
      render :new
    end
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.status = "PROPOSAL"

    if @offer.update(offer_params)
      redirect_to offer_path
    else
      render :edit
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    # redirect_to current_listing_path
  end

  def accept_offer
    @offer = Offer.find(params[:id])
    @offer.status = "CONFIRMED"
    @offer.save
    redirect_to offer_path, alert: "This offer is now accepted. Status has changed from Proposal to Confirmed."
  end

  private

  def offer_params
    params.require(:offer).permit(:price, :start_date, :end_date)
  end
end
