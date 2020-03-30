# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Help, type: :model do
  describe 'macros' do
    it { is_expected.to define_enum_for(:status).with_values(pending: 0, active: 1, inactive: 2, deleted: 3) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:help_type) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:fullname) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:cellphone) }
    it { is_expected.to validate_presence_of(:province) }
    it { is_expected.to validate_presence_of(:county) }
    it { is_expected.to validate_presence_of(:district) }
    it { is_expected.to validate_presence_of(:neighborhood) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_inclusion_of(:help_type).in_array(Help::HELP_TYPES.keys.map(&:to_s)) }
  end
end
