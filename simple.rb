require 'rack/app'

# Example to basic syntax
class Simple < Rack::App
  get '/' do
    'OK'
  end
end
