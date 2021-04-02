class CreateBreweries < ActiveRecord::Migration[6.1]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :style
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
