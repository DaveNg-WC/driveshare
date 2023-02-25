class AddUserIdToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :user_id, :integer
    add_foreign_key :offers, :users
  end
end
