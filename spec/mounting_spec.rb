require 'spec_helper'

RSpec.describe ImportantReasource do
  include Rack::App::Test

  describe 'GET /hello/:name' do
    subject(:response) { get('/hello/there') }

    it { expect(response.body).to eq 'there' }
  end
end

RSpec.describe ProtectedAPI do
  include Rack::App::Test

  describe 'my custom validation' do
    subject(:request) { get('/', headers: headers) }

    context 'when request is "authenticated"' do
      let(:headers) { { allow_me: 'please' } }

      it { expect(request.status).to eq 200 }
    end

    context 'when request is unsigned' do
      let(:headers) { { allow_me: 'NOW!' } }

      it { expect(request.status).to eq 401 }
    end
  end

  it { mount ImportantReasource, to: '/' }
end

RSpec.describe MyAwesomeApp do
  include Rack::App::Test

  it { mount ProtectedAPI, to: '/api' }
end
