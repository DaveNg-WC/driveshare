class ListingsController < ApplicationController
  # whitelisting these pages to public, without log in [devise]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    # if params[:query1].present? && params[:query2].blank?
    #   @listings = Listing.where('brand ILIKE ?', params[:query1])
    # elsif params[:query1].blank? && params[:query2].present?
    #   @listings = Listing.where('price <= ?', params[:query2])
    # elsif params[:query1].present? && params[:query2].present?
    #   @listings = Listing.where('brand ILIKE ? AND price <= ?', params[:query1], params[:query2])
    # else
    #   @listings = Listing.all
    # end
    @listings = Listing.all
    @listings = @listings.where('brand ILIKE ?', params[:search_brand]) if params['search_brand'].present?
    @listings = @listings.where('price <= ?', params[:search_price]) if params['search_price'].present?
    @listings = @listings.where('category ILIKE ?', params[:search_category]) if params['search_category'].present?
    @listings = @listings.where('transmission ILIKE ?', params[:search_transmission]) if params['search_transmission'].present?

    # The `geocoded` scope filters only flats with coordinates
    @markers = @listings.geocoded.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        info_window: render_to_string(partial: "popup_map", locals: {listing: listing})
      }
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @reviews = @listing.reviews
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)

    @listing.user_id = current_user.id # Hard coding. To update to user_id when devise is done.
    if @listing.save
      redirect_to my_listings_path, notice: "Listing was successfully created."
    else
      render :new
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])

    if @listing.update(listing_params)
      redirect_to listing_path(@listing), notice: "Listing was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    redirect_to my_listings_path, notice: "Listing was successfully deleted."
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :brand, :transmission, :category, :description, :price, :address, photos: [])
  end

  def offer_params
    params.require(:offer).permit(:price, :start_date, :end_date)
  end
end
