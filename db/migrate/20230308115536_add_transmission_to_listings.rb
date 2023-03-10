class AddTransmissionToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :transmission, :string
  end
end
