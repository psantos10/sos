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

# == Schema Information
#
# Table name: volunteers
#
#  id                    :bigint           not null, primary key
#  cellphone             :string
#  county                :string
#  email                 :string
#  fullname              :string
#  password_digest       :string
#  province              :string
#  types_of_availability :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_volunteers_on_cellphone  (cellphone) UNIQUE
#  index_volunteers_on_email      (email) UNIQUE
#
