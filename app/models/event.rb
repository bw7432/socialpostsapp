class Event < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :eventable, polymorphic: true, optional: true

  enum type_of: {
    post: 1,
    comment: 2,
    rating: 3,
    github: 4,
  }
end
