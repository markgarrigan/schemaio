require "sinatra/config_file"
require_relative "schemaio"

class App < Sinatra::Base
  register Sinatra::ConfigFile

  config_file './schemaio.yml'

  before do
    @schemaio = Schemaio.new(id: settings.user, key: settings.key)
  end

  post '/login' do
    @schemaio.login(email: params[:email], password: params[:password])
  end

  get '/*/?' do
    @schemaio.get(request.path_info)
  end

  post '/*/?' do
    @schemaio.post(request.path_info)
  end

  put '/*/?' do
    @schemaio.post(request.path_info)
  end

  delete '/*/' do
    @schemaio.post(request.path_info)
  end
end
