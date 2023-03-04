class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = 2 # Hard coding. To update to user_id when devise is done.
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
    params.require(:listing).permit(:name, :description, :price, :address, :photo)
  end
end
