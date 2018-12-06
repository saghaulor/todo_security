# Install

```sh
docker-compose up --build
```

# Prepare db
```sh
docker-compose run -e RAILS_ENV=production web rake db:create db:schema:load db:seed assets:precompile
```

# Hack the planet!
- visit [todo_security](http://localhost:3000)
