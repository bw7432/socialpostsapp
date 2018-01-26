class Rating < ApplicationRecord
  belongs_to :user
  has_one :event, as: :eventable
  before_create :log_event


  def log_event
    # log event here
    # LogModelAction.perform(self)
  end
end
