class SaveGithubEventsService

  def self.process(event, user)

    this_event = Event.find_by(github_event_id: event['id']) || Event.new
    case event['type']
      when "PullRequestEvent"
        case event['payload']['action']
          when "created"
            save = true
            this_event.description = "Opened a pull request <span class='github_txt'>##{event['number']}</span> for <span class='github_txt'>#{event['repo']['name']}</span>"
          when "merged"
            save = true
            this_event.description = "Merged <span class='github_txt'>##{event['number']}</span> into <span class='github_txt'>#{event['repo']['name']}</span>"
        end
      when "RepositoryEvent"
        case event['payload']['action']
          when "created"
            save = true
            this_event.description = "#{event['login']} created a pull request <span class='github_txt'>##{event['number']}</span> for <span class='github_txt'>#{event['repo']['name']}</span>"
        end
      when "PushEvent"
        save = true
        this_event.description = "Pushed #{event['payload']['size']} commit(s) to #{event['repo']['name']}."
    else
      save = false
    end
    if save
      this_event.eventable_id = user.id
      this_event.eventable_type = user.class.name
      this_event.posted_at = Date.strptime(event['created_at'])
      this_event.user_id = user.id
      this_event.github_event_id = event['id']
      this_event.type_of = "github"
      this_event.save
    end
  end

end
