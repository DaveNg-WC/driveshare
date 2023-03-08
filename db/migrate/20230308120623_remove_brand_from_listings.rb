class RemoveBrandFromListings < ActiveRecord::Migration[7.0]
  def change
    remove_column :listings, :brand
  end
end
