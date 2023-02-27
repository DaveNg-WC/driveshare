class AddForHostToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :for_host, :boolean
  end
end
