class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references :user, foreign_key: true
      t.integer :rater_id
      t.integer :rating
      t.timestamp :rated_at

      t.timestamps
    end
  end
end
