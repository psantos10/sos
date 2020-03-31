# frozen_string_literal: true

FactoryBot.define do
  factory :volunteer do
    fullname { 'John Doe' }
    sequence(:email) { |n| "John.Doe#{n}@example.com" }
    password { 'Super$123456' }
    cellphone { '924123456' }
    types_of_availability { %w[donation_food_clothes psychological_support] }
    province { 'Luanda' }
    county { 'Belas' }
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
