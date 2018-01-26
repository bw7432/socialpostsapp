class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  before_save -> { skip_confirmation! }
  has_many :posts
  has_many :events
  has_many :ratings
  has_one :event, as: :eventable

  def log_event
    # log event here
    # LogModelAction.perform(self)
  end
end
