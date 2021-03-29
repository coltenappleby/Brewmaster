class CreateBeers < ActiveRecord::Migration[6.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.integer :brewery_id
      t.integer :alcohol

      t.timestamps
    end
  end
end
