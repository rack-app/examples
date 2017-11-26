require 'rack/app'

class MyAwesomeMiddleware
  def initialize(app, key, value)
    @app = app
    @key = key
    @value = value
  end

  def call(env)
    env[@key] = @value
    @app.call(env)
  end
end

class MiddlewareUse < Rack::App
  use MyAwesomeMiddleware, 'global', 'hello'

  middlewares do
    use MyAwesomeMiddleware, 'you can define like this', 'too'
  end

  next_endpoint_middlewares do
    use MyAwesomeMiddleware, 'esm', ' world!'
  end
  get '/esm' do
    message
  end

  get do
    message
  end

  get '/mw_block' do
    request.env['you can define like this']
  end

  def message
    request.env['global'].to_s + request.env['esm'].to_s
  end
end
