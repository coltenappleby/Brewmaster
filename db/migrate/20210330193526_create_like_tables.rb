class CreateLikeTables < ActiveRecord::Migration[6.1]
  def change
    create_table :like_tables do |t|
      t.integer :review_id
      t.integer :user_id

      t.timestamps
    end
  end
end
