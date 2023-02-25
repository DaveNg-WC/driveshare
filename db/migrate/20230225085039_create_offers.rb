class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.integer :price
      t.date :start_date
      t.date :end_date
      t.string :status
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
