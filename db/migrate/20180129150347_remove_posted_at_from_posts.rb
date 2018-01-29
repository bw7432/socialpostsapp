class RemovePostedAtFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :posted_at, :timestamp
    remove_column :events, :posted_at, :timestamp
    remove_column :comments, :commented_at, :timestamp
    remove_column :ratings, :rated_at, :timestamp
  end
end
