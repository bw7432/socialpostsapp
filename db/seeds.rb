require "roo"

users_spreadsheet = Roo::CSV.new("#{Rails.root}/db/users.csv")
users_header = users_spreadsheet.row(1)
(2..users_spreadsheet.last_row).map do |i|
  row = Hash[[users_header, users_spreadsheet.row(i)].transpose]
  user = User.find_by(email: row["email"]) || User.new
  user.id = row["id"]
  user.email = row["email"]
  user.password = "my_secure_password"
  user.password_confirmation = "my_secure_password"
  user.name = row["name"]
  user.created_at = row["created_at"]
  user.github_username = row["github_username"]
  user.save
end


posts_spreadsheet = Roo::CSV.new("#{Rails.root}/db/posts.csv", csv_options: { liberal_parsing: true})
posts_header = posts_spreadsheet.row(1)
(2..posts_spreadsheet.last_row).map do |i|
  row = Hash[[posts_header, posts_spreadsheet.row(i)].transpose]
  post = Post.find_by(id: row["id"].to_i) || Post.new
  post.id = row["id"]
  post.title = row["title"]
  post.body = row["body"]
  post.user_id = row["user_id"]
  post.posted_at = row["posted_at"]
  post.created_at = row["created_at"]
  post.updated_at = row["updated_at"]
  post.save
end


comments_spreadsheet = Roo::CSV.new("#{Rails.root}/db/comments.csv", csv_options: { liberal_parsing: true})
comments_header = comments_spreadsheet.row(1)
(2..comments_spreadsheet.last_row).map do |i|
  row = Hash[[comments_header, comments_spreadsheet.row(i)].transpose]
  comment = Comment.find_by(id: row["id"]) || Comment.new
  comment.id = row["id"]
  comment.message = row["message"]
  comment.user_id = row["user_id"]
  comment.post_id = row["post_id"]
  comment.commented_at = row["commented_at"]
  comment.created_at = row["created_at"]
  comment.updated_at = row["updated_at"]
  comment.save
end


ratings_spreadsheet = Roo::CSV.new("#{Rails.root}/db/ratings.csv", csv_options: { liberal_parsing: true})
ratings_header = ratings_spreadsheet.row(1)
(2..ratings_spreadsheet.last_row).map do |i|
  row = Hash[[ratings_header, ratings_spreadsheet.row(i)].transpose]
  rating = Rating.find_by(id: row["id"]) || Rating.new
  rating.id = row["id"]
  rating.user_id = row["user_id"]
  rating.rater_id = row["rater_id"]
  rating.rating = row["rating"]
  rating.rated_at = row["rated_at"]
  rating.created_at = row["created_at"]
  rating.updated_at = row["updated_at"]
  rating.save
end
