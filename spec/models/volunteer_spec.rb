# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Volunteer, type: :model do
  describe 'macros' do
    it { is_expected.to have_secure_password }
    it { is_expected.to serialize(:types_of_availability).as(Array) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:fullname) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:cellphone) }
    it { is_expected.to validate_presence_of(:province) }
    it { is_expected.to validate_presence_of(:county) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:cellphone) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:volunteer_helps).dependent(:destroy) }
    it { is_expected.to have_many(:helps).through(:volunteer_helps) }
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
