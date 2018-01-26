class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_one :event, as: :eventable
  has_many :comments
  before_save :log_event


  def log_event
    # log event here
    LogModelActionService.perform(self, 'post')
  end
end
