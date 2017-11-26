require 'spec_helper'

RSpec.describe MiddlewareUse do
  include Rack::App::Test

  describe 'GET /' do
    subject(:response) { get '/' }

    it { expect(response.body).to eq 'hello' }
  end

  describe 'GET /esm' do
    subject(:response) { get '/esm' }

    it { expect(response.body).to eq 'hello world!' }
  end

  describe 'GET /mw_block' do
    subject(:response) { get '/mw_block' }

    it { expect(response.body).to eq 'too' }
  end
end
