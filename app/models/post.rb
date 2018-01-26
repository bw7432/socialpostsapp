class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_one :user_event, as: :eventable
  after_save :log_event


  def log_event
    # log event here
  end
end
