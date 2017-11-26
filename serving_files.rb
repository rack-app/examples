require 'rack/app'

class ServingFiles < Rack::App
  # as endpoint creation
  mount_directory './serving_files', to: '/as_endpoints'

  # without endpoint creation
  serve_files_from './serving_files', to: '/as_file_server'

  # or as part of an endpoint control logic
  get do
    serve_file './serving_files/example.html'
  end
end
