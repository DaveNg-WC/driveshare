class ChangeColumnNameToBrand < ActiveRecord::Migration[7.0]
  def change
    rename_column :listings, :name, :brand
  end
end
