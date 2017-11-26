require 'spec_helper'

RSpec.describe SerializeBasic do
  include Rack::App::Test

  describe 'GET /' do
    subject(:response) { get '/' }

    it { expect(response.body).to eq '{"hello":"world"}' }
  end
end
