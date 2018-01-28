class LogModelActionService

  def self.perform(record, type_of)
    puts record
    this_event = Event.new
    case type_of
      when "post"
        post_name = record.title
        this_event.description = "<span class='info_heading'>New Post</span> #{post_name}"
        this_event.type_of = "post"
        this_event.user_id = record.user_id
      when "comment"
        post_author = record.user.name
        this_event.description = "Commented on a post by #{post_author}"
        this_event.type_of = "comment"
        this_event.user_id = record.user_id
    end
    this_event.eventable_id = record.id
    this_event.eventable_type = record.class.name
    this_event.created_at = record.created_at
    this_event.save
  end

end
