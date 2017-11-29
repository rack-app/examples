require 'rack/app'

class ImportantReasource < Rack::App
  get '/hello/:name' do
    params['name']
  end
end

class ProtectedAPI < Rack::App
  before do
    http_status!(401) unless request.env['HTTP_ALLOW_ME'] == 'please'
  end
  get {}

  mount ImportantReasource

  puts middlewares
end

class MyAwesomeApp < Rack::App
  mount ProtectedAPI, to: '/api'
end
