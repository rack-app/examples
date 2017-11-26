require 'spec_helper'

RSpec.describe Streaming do
  include Rack::App::Test

  describe 'GET /' do
    subject(:response) { get '/' }
    it { expect(response.body).to eq '12345' }
  end
end
