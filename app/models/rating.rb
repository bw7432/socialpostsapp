class Rating < ApplicationRecord
  belongs_to :user, optional: true
  has_one :event, as: :eventable
  # before_create :log_event
  after_save :calculate_rating


  # def log_event
  #   # log event here
  #   LogModelActionService.perform(self, 'rating')
  # end

  def calculate_rating
    CalculateRatingService.perform(self)
  end
end
