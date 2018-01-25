class Comment < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :user, optional: true
  after_save :log_event


  def log_event
    # log event here
  end
end
