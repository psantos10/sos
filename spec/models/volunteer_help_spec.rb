# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VolunteerHelp, type: :model do
  describe 'macros' do
    it { is_expected.to define_enum_for(:status).with_values(pending: 0, accepted: 1, declined: 2, canceled: 3) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:volunteer) }
    it { is_expected.to belong_to(:help) }
  end

  describe 'validations' do
    before { create(:volunteer_help) }

    it { is_expected.to validate_uniqueness_of(:volunteer_id).scoped_to(:help_id) }
  end
end
