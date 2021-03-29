class CreateBreweries < ActiveRecord::Migration[6.1]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :city
      t.string :style

      t.timestamps
    end
  end
end
