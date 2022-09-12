# Run in dev mode mode

```
bundle
rails db:migrate
./bin/dev
```


# Run in production mode

```
docker compose build
docker compose run web rake db:migrate
docker compose up
```
