# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Province, type: :model do
  describe 'validations' do
    before { described_class.create({ name: 'LUANDA' }) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end
end

# == Schema Information
#
# Table name: provinces
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_provinces_on_name  (name) UNIQUE
#
