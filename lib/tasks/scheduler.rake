desc 'load events from github'
task :load_github_events => [:environment] do
  User.where.not(github_username: nil).find_each do |user|
    # paginate this in production
    puts "user"
    github = GithubEventsService.new("github", 1)
    github.events_performed(user.github_username).each do |event|
      puts "test"
      SaveGithubEventsService.process(event, user)
    end
  end
end
