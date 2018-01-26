class Rating < ApplicationRecord
  belongs_to :user
  has_one :user_event, as: :eventable
  after_save :log_event


  def log_event
    # log event here
  end
end
