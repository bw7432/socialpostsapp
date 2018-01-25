class Rating < ApplicationRecord
  belongs_to :user
  after_save :log_event


  def log_event
    # log event here
  end
end
