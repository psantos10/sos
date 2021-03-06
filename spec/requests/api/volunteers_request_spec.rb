# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API::Volunteers', type: :request do
  let(:headers) { { 'ACCEPT' => 'application/json' } }

  describe 'POST /api/volunteers/auth' do
    before do
      post '/api/volunteers/auth', params: params, headers: headers
    end

    context 'with valid credentials' do
      subject { response.parsed_body['volunteer'] }

      let(:volunteer) { create(:volunteer, password: 'secret$123') }
      let(:params) { { auth: { email: volunteer.email, password: 'secret$123' } } }

      it { expect(response.content_type).to eq('application/json; charset=utf-8') }
      it { expect(response).to have_http_status(:ok) }

      it { expect(session[:volunteer_id]).to eq volunteer.id }

      it { is_expected.to include('id' => Integer) }
      it { is_expected.to include('fullname' => String) }
      it { is_expected.to include('province' => String) }
      it { is_expected.to include('county' => String) }
      it { is_expected.to include('types_of_availability' => Array) }
    end

    context 'with invalid credentials' do
      subject { response.parsed_body }

      let(:params) { { auth: { email: 'unknow@example.com', password: 'bad$password' } } }

      it { expect(response.content_type).to eq('application/json; charset=utf-8') }
      it { expect(response).to have_http_status(:unauthorized) }

      it { expect(session[:volunteer_id]).to eq nil }

      it { is_expected.to include('message' => 'Authentication failed') }
      it { is_expected.to include('code' => 401) }
    end
  end

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
