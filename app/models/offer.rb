class Offer < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  before_create :set_defaults

  private

  def set_defaults
    self.status = "PROPOSAL"
    # self.user_id = @currentuser.id
    # self.listing_id = @currentlisting.id (params[:id])
  end
end
