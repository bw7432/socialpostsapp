class Post < ApplicationRecord
  belongs_to :user, optional: true
  after_save :log_event


  def log_event
    # log event here
  end
end
