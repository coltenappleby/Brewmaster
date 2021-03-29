class CreateBeerMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :beer_menus do |t|
      t.integer :bar_id
      t.integer :beer_id

      t.timestamps
    end
  end
end
