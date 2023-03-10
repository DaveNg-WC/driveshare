class AddBrandToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :brand, :string
  end
end
