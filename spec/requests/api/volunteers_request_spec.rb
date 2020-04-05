# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API::Volunteers', type: :request do
  let(:headers) { { 'ACCEPT' => 'application/json' } }

  describe 'POST /api/volunteers' do
    before do
      post '/api/volunteers', params: params, headers: headers
    end

    context 'with invalid params' do
      let(:params) { { volunteer: { fullname: '' } } }

      it { expect(response.content_type).to eq('application/json; charset=utf-8') }
      it { expect(response).to have_http_status(:unprocessable_entity) }

      it { expect(response.parsed_body['fullname']).to eq(["can't be blank"]) }
      it { expect(response.parsed_body['email']).to eq(["can't be blank"]) }
      it { expect(response.parsed_body['password']).to eq(["can't be blank"]) }
      it { expect(response.parsed_body['cellphone']).to eq(["can't be blank"]) }
      it { expect(response.parsed_body['province']).to eq(["can't be blank"]) }
      it { expect(response.parsed_body['county']).to eq(["can't be blank"]) }
    end

    context 'with valid params' do
      let(:params) do
        {
          volunteer: {
            fullname: 'John Doe',
            email: 'john.doe@example.com',
            password: 'secret$123',
            cellphone: '924123456',
            province: 'Luanda',
            county: 'Belas',
            types_of_availability: %w[donation_food_clothes psychological_support]
          }
        }
      end

      it { expect(response.content_type).to eq('application/json; charset=utf-8') }
      it { expect(response).to have_http_status(:created) }

      it { expect(response.parsed_body['volunteer']['fullname']).to eq('John Doe') }
      it { expect(response.parsed_body['volunteer']['province']).to eq('Luanda') }
      it { expect(response.parsed_body['volunteer']['county']).to eq('Belas') }
      it { expect(response.parsed_body['volunteer']['types_of_availability']).to eq(%w[donation_food_clothes psychological_support]) }
    end
  end
end
