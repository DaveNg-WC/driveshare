class OffersController < ApplicationController
  def index
    @offers = Offer.all
    # @user_offers = Offer.where(user_id: 1)
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def create
    @offer = Offer.new(offer_params)

    if @offer.save
      # redirect_to specific_offer_page
    else
      render :new
    end
  end

  def update
    @offer = Offer.find(params[:id])

    if @offer.update(offer_params)
      # redirect_to specific_offer_page
    else
      render :edit
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    # redirect_to current_listing_path
  end


  private

  def offer_params
    params.require(:offer).permit(:price, :start_date, :end_date)
  end
end
