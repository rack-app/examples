require 'rack/app' # v4+

require 'yaml'
class ParamsValidated < Rack::App

  desc 'validated endpoint with params parsing'
  validate_params do
    required 'dog_names', :class => Array, :of => String, :desc => 'dog names', :example => ['Molly']
    optional :some_json_content, :class => JSON
  end
  get do
    YAML.dump(params)
  end

end