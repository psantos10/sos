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
        'district' => String
      }
    end
    let(:not_include_attributes) do
      {
        'email' => String,
        'cellphone' => String,
        'alternative_cellphone' => String,
        'neighborhood' => String,
        'address' => String

      }
    end

    it { expect(serialized_object).to include(help_attributes) }
    it { expect(serialized_object).not_to include(not_include_attributes) }
  end
end

# == Schema Information
#
# Table name: helps
#
#  id                    :bigint           not null, primary key
#  address               :string
#  alternative_cellphone :string
#  cellphone             :string
#  county                :string
#  description           :text
#  district              :string
#  email                 :string
#  fullname              :string
#  help_type             :string
#  neighborhood          :string
#  province              :string
#  status                :integer
#  title                 :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_helps_on_email   (email)
#  index_helps_on_status  (status)
#
