# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API::Helps', type: :request do
  let(:headers) { { 'ACCEPT' => 'application/json' } }

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

      it { expect(response.parsed_body['help_type']).to eq('donation_food_clothes') }
      it { expect(response.parsed_body['title']).to eq('Need someone to bring me to the hospital') }
      it { expect(response.parsed_body['description']).to eq('Need someone to bring me to the hospital since I am in risk group') }
      it { expect(response.parsed_body['fullname']).to eq('Jane Doe') }
      it { expect(response.parsed_body['cellphone']).not_to eq('924123456') }
      it { expect(response.parsed_body['province']).to eq('Luanda') }
      it { expect(response.parsed_body['county']).to eq('Belas') }
      it { expect(response.parsed_body['neighborhood']).to eq('Kilamba') }
      it { expect(response.parsed_body['address']).to eq('Rua K, Prédio H, Porta 150 2º Andar') }
    end
  end
end
