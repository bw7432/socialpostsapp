class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_one :event, as: :eventable
  has_many :comments
  before_create :log_event

  validates :title, presence: true
  validates :body, presence: true


  def log_event
    # log event here
    LogModelActionService.perform(self, 'post')
  end
end
