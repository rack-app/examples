require 'rack/app'

require 'yaml'
require 'json'

class SerializeFineTune < Rack::App
  formats do
    on '.yaml', 'application/x-yaml' do |obj|
      YAML.dump(obj)
    end

    on '.json', 'application/json' do |obj|
      JSON.dump(obj)
    end

    default 'optional default content type', &:inspect
  end

  get '/on_multiple_formats' do
    { hello: 'world' }
  end
end
