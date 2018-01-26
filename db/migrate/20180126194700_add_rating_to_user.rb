class AddRatingToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :rating, :decimal
  end
end
