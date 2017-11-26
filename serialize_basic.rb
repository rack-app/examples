require 'rack/app'
require 'json'

class SerializeBasic < Rack::App
  serializer do |obj|
    JSON.dump(obj)
  end

  get '/' do
    { :hello => 'world' }
  end
end
