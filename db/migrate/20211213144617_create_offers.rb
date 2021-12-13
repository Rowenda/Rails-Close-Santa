class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.date :availability
      t.string :location
      t.integer :price_per_hour
      t.text :offer_description
      t.string :title
      t.string :santa_description

      t.timestamps
    end
  end
end
