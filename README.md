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

run 'rspec'

## Documentation for routes
```
/apipie
```
## Authors

* **Ben WArren** [https://github.com/bw7432](https://github.com/bw7432)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
