class CalculateRatingService

  def self.perform(record)
    rating = Rating.where(user_id: record.user_id).average(:rating)
    User.find(record.user_id).update_attribute(:rating, rating)
    if rating >= 4
      if !Event.exists?(user_id: record.user_id, type_of: "rating")
        this_event = Event.new
        this_event.description = "Surpassed 4 Stars!"
        this_event.type_of = "rating"
        this_event.user_id = record.user_id
        this_event.eventable_id = record.id
        this_event.eventable_type = record.class.name
        this_event.created_at = record.created_at
        this_event.save
      end
    end
  end

end
