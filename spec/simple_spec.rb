require 'spec_helper'

RSpec.describe Simple do
  include Rack::App::Test

  describe 'GET /' do
    subject(:response) { get('/') }

    it { expect(response.status).to eq 200 }
    it { expect(response.body).to eq 'OK' }
  end
end
