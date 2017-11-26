require 'spec_helper'

RSpec.describe ServingFiles do
  include Rack::App::Test

  describe 'as endpoints' do
    subject(:response) { get '/' }

    it { expect(response.body).to include '<h1>Hello world!</h1>' }
  end

  describe 'as endpoints with singleton method that help generate endpoints' do
    subject(:response) { get '/as_endpoints/example.html' }

    it { expect(response.body).to include '<h1>Hello world!</h1>' }
  end

  describe 'as mounteded folder' do
    subject(:response) { get '/as_file_server/example.html' }

    it { expect(response.body).to include '<h1>Hello world!</h1>' }
  end
end
