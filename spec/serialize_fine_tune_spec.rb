require 'spec_helper'

RSpec.describe SerializeFineTune do
  include Rack::App::Test
  describe 'GET /' do
    subject(:response) { get(request_path) }
    let(:endpoint_path) { '/on_multiple_formats' }
    let(:request_path) { endpoint_path + '.' + format }

    context 'when json is the request path end' do
      let(:format) { 'json' }

      it { expect(response.body).to eq '{"hello":"world"}' }
    end

    context 'when yaml is the request path end' do
      let(:format) { 'yaml' }

      it { expect(response.body).to eq "---\n:hello: world\n" }
    end

    context 'when no format given' do
      let(:request_path) { endpoint_path }

      it { expect(response.body).to eq({ hello: 'world' }.inspect) }
    end
  end
end
