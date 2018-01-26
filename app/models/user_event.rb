class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :eventable, polymorphic: true
end
