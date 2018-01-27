class GithubEventsService

  include HTTParty
  base_uri 'api.github.com'

  def initialize(service, page)
   @options = { query: { site: service, page: page } }
  end

  def events_performed(username)
    self.class.get("/users/#{username}/events", @options)
  end
end
