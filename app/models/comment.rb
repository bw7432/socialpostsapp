class Comment < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :user, optional: true
  has_one :event, as: :eventable
  before_create :log_event


  def log_event
    # log event here
    LogModelActionService.perform(self, 'comment')
  end
end
