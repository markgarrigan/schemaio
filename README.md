# Schema.io Sinatra App

This is a starter app that I'm using as a proxy to the [schema.io][1] api. The actual app is a javascript app that makes calls to this app, which makes the actual calls to the [schema.io][1] api.

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

If you plan on using unicorn to run the app. There is an example ```unicorn.rb``` file which will need the path to your app.

Copy ```unicorn.rb.example``` to a new file and name it ```unicorn.rb```

Update the ```@dir``` to the path of your app.

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

## schemaio.rb

This is a very rudimentary ruby client to interface with the [schema.io][1] api. It is not fully tested nor does it claim to be a complete wrapper for the api. It's just to get started using the api. Feel free to enhance it.

https://github.com/markgarrigan/schema-ruby-client

[1]: http://schema.io
