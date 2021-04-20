# Install

# Prerequisites:
0. You have docker and docker compose installed
1. You do not have a service running on port 3306, the docker-compose command will start mysql and bind to port 3306
2. You do not have a service running on port 3000, the docker-compose command will start rails and bind to port 3000

```sh
# This will build the containers and start the services in the foreground
docker-compose up --build
```

# Prepare db
```sh
# This will prepare the db and compile the assets so that the app is ready to run
docker-compose run -e RAILS_ENV=production web bundle exec rake db:create db:schema:load db:seed assets:precompile
```

# Recreate the db
```sh
# This will destroy the db and recreate it (should you somehow get into a state where the app is hosed from your amazing pentesting attempts)
docker-compose run -e RAILS_ENV=production -e DISABLE_DATABASE_ENVIRONMENT_CHECK=1 web bundle exec rake db:drop db:create db:schema:load db:seed
```

# Hack the planet!
- visit [todo_security](http://localhost:3000)
