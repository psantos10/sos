# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API::Helps', type: :request do
  let(:headers) { { 'ACCEPT' => 'application/json' } }
  let(:params) { nil }

  describe 'GET /api/helps' do
    before do
      create_list(:help, 3)
      get '/api/helps', params: params, headers: headers
    end

    it { expect(response.content_type).to eq('application/json; charset=utf-8') }
    it { expect(response).to have_http_status(:ok) }

    describe 'response body' do
      subject { response.parsed_body['helps'] }

      it { is_expected.to all include('id' => Integer) }
      it { is_expected.to all include('type' => String) }
      it { is_expected.to all include('title' => String) }
      it { is_expected.to all include('description' => String) }
      it { is_expected.to all include('fullname' => String) }
      it { is_expected.to all include('province' => String) }
      it { is_expected.to all include('county' => String) }
      it { is_expected.to all include('district' => String) }
      it { is_expected.to all exclude('neighborhood' => String) }
      it { is_expected.to all exclude('address' => String) }
    end

    context 'when pagination params are given' do
      let(:params) { { page: 1, per_page: 2 } }

      it { expect(response.parsed_body.count).to eq(2) }
    end
  end

  describe 'POST /api/helps' do
    before do
      post '/api/helps', params: params, headers: headers
    end

    context 'with invalid params' do
      let(:params) { { help: { title: '' } } }

      it { expect(response.content_type).to eq('application/json; charset=utf-8') }
      it { expect(response).to have_http_status(:unprocessable_entity) }

      it { expect(response.parsed_body['help_type']).to eq(["can't be blank", 'is not included in the list']) }
      it { expect(response.parsed_body['title']).to eq(["can't be blank"]) }
      it { expect(response.parsed_body['description']).to eq(["can't be blank"]) }
      it { expect(response.parsed_body['fullname']).to eq(["can't be blank"]) }
      it { expect(response.parsed_body['cellphone']).to eq(["can't be blank"]) }
      it { expect(response.parsed_body['province']).to eq(["can't be blank"]) }
      it { expect(response.parsed_body['county']).to eq(["can't be blank"]) }
      it { expect(response.parsed_body['neighborhood']).to eq(["can't be blank"]) }
      it { expect(response.parsed_body['address']).to eq(["can't be blank"]) }
    end

    context 'with valid params' do
      let(:params) do
        {
          help: {
            help_type: 'donation_food_clothes',
            title: 'Need someone to bring me to the hospital',
            description: 'Need someone to bring me to the hospital since I am in risk group',
            fullname: 'Jane Doe',
            cellphone: '924123456',
            province: 'Luanda',
            county: 'Belas',
            neighborhood: 'Kilamba',
            address: 'Rua K, Prédio H, Porta 150 2º Andar'
          }
        }
      end

      it { expect(response.content_type).to eq('application/json; charset=utf-8') }
      it { expect(response).to have_http_status(:created) }

      it { expect(response.parsed_body['help']['type']).to eq('Doação (Alimentação e Vestuário)') }
      it { expect(response.parsed_body['help']['title']).to eq('Need someone to bring me to the hospital') }
      it { expect(response.parsed_body['help']['description']).to eq('Need someone to bring me to the hospital since I am in risk group') }
      it { expect(response.parsed_body['help']['fullname']).to eq('Jane Doe') }
      it { expect(response.parsed_body['help']['cellphone']).not_to eq('924123456') }
      it { expect(response.parsed_body['help']['province']).to eq('Luanda') }
      it { expect(response.parsed_body['help']['county']).to eq('Belas') }
      it { expect(response.parsed_body['help']).not_to include('neighborhood' => String) }
      it { expect(response.parsed_body['help']).not_to include('address' => String) }
    end
  end
end
