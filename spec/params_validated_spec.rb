require 'spec_helper'

RSpec.describe ParamsValidated do
  include Rack::App::Test

  describe 'GET /' do
    subject(:response) { get '/', params: params }

    context 'when params given' do
      let(:params) { { dog_names: %w[Loli Molly] } }

      it { expect(response.status).to eq 200 }

      context 'and an optional params given' do
        before { params.merge!(:some_json_content => json_content) }

        context 'but in malformed' do
          let(:json_content) { '{hello: "world"}' }

          it { expect(response.status).to eq 422 }
        end

        context 'and in a valid format' do
          let(:json_content) { '{"hello":"world"}' }

          it { expect(response.status).to eq 200 }
          it { expect(YAML.safe_load(response.body)['some_json_content']).to include 'hello' => 'world' }
        end
      end
    end
  end
end
