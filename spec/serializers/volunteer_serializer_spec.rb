# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VolunteerSerializer, type: :serializer do
  subject(:serialized_object) { JSON.parse(described_class.new(volunteer).to_json) }

  describe 'Volunteer serialization' do
    let(:volunteer) { create(:volunteer) }
    let(:volunteer_attributes) do
      {
        'id' => Integer,
        'fullname' => String,
        'province' => String,
        'county' => String,
        'types_of_availability' => Array
      }
    end

    it { expect(serialized_object).to include(volunteer_attributes) }
    it { expect(serialized_object).not_to include({ 'email' => String, 'cellphone' => String }) }
  end
end
