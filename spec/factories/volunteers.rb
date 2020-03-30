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
