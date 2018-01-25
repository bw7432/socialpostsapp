require 'roo'

users_spreadsheet = Roo::CSV.new("#{Rails.root}/db/users.csv")
users_header = users_spreadsheet.row(1)
(2..users_spreadsheet.last_row).map do |i|
  row = Hash[[users_header, users_spreadsheet.row(i)].transpose]
  user = User.find_by(email: row['email']) || User.new
  user.id = row['id']
  user.email = row['email']
  user.password = "my_secure_password"
  user.password_confirmation = "my_secure_password"
  user.name = row['name']
  user.created_at = row['created_at']
  user.github_username = row['github_username']
  user.save
end
