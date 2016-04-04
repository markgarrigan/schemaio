# Schema.io Sinatra App

```
git clone git@github.com:markgarrigan/schemaio.git

cd schemaio

bundle install
or
bundle install --path .bundle
```

## Configuration

Copy ```schemaio.yml.example``` to a new file and name it ```schemaio.yml```

Update the values for your schema.io account.

```
# ./schemaio.yml.example

development: &common_settings
  user: '<clientid>'
  key: '<clientkey>'

production:
  <<: *common_settings
  key: '<clientkey>'
```

If you plan on using unicorn to run the app. There is an example unicorn.rb file which will need the path to your app.

```
# ./unicorn.rb.example

# set path to app that will be used to configure unicorn,
@dir = "/path/to/app"

...
```

## Running with Rack

```
rackup
```

## Running with webserver configured for unicorn

```
bundle exec unicorn -c unicorn.rb -D
```
