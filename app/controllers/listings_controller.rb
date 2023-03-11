class ListingsController < ApplicationController
  def index
    if params[:query1].present? && params[:query2].blank?
      @listings = Listing.where('brand ILIKE ?', params[:query1])
    elsif params[:query1].blank? && params[:query2].present?
      @listings = Listing.where('price <= ?', params[:query2])
    elsif params[:query1].present? && params[:query2].present?
      @listings = Listing.where('brand ILIKE ? AND price <= ?', params[:query1], params[:query2])
    else
      @listings = Listing.all
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
    # raise
    @listing.user_id = current_user.id # Hard coding. To update to user_id when devise is done.
    if @listing.save
      redirect_to listings_path, notice: "Listing was successfully created."
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

    redirect_to listings_path, notice: "Listing was successfully deleted."
  end

  private

  def listing_params
    params.require(:listing).permit(:brand, :transmission, :category, :description, :price, :address, :photo)
  end
end
