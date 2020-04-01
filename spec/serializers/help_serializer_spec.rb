# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HelpSerializer, type: :serializer do
  subject(:serialized_object) { JSON.parse(described_class.new(help).to_json) }

  describe 'Help serialization' do
    let(:help) { create(:help) }
    let(:help_attributes) do
      {
        'id' => Integer,
        'help_type' => String,
        'title' => String,
        'description' => String,
        'fullname' => String,
        'province' => String,
        'county' => String,
        'district' => String,
        'neighborhood' => String,
        'address' => String
      }
    end

    it { expect(serialized_object).to include(help_attributes) }
    it { expect(serialized_object).not_to include({ 'email' => String, 'cellphone' => String, 'alternative_cellphone' => String }) }
  end
end
