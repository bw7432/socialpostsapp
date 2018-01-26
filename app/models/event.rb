class Event < ApplicationRecord
  belongs_to :user
  belongs_to :eventable, polymorphic: true

  enum type_of: {
    post: 1,
    comment: 2,
    rating: 3,
    github: 4,
  }
end
