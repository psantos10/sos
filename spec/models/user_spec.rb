# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'macros' do
    it { is_expected.to have_secure_password }
  end

  describe 'validations' do
    subject { create(:user) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:phone).case_insensitive }
  end
end
