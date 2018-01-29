# SocialPostsApp

This is a rails 5 api only social posts app

### Installing

Clone the repository, run bundle and follow the steps below to get things up and running.

edit 'database.yml' with your credentials

```
rails db:create
```

```
rails db:migrate
```

```
rails db:seed
```
Run this starting out, then set up some kind of recurring job to run this as often as you would like.
```
rake load_github_events
```

## Running the tests
```
rspec
```
or
```
bundle exec guard
```
## Documentation for routes
```
/apipie
```

## To do
Developers in the future could build the feed on the front end using saved words from 'use_words' array field in Event model. They will also need to secure everything (make sure a user cannot create a post for another user, etc.) and implement devise before actions for authentication.

## Authors

* **Ben Warren** [https://github.com/bw7432](https://github.com/bw7432)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
