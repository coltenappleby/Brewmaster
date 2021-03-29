class CreateBars < ActiveRecord::Migration[6.1]
  def change
    create_table :bars do |t|
      t.string :name
      t.string :city

      t.timestamps
    end
  end
end
