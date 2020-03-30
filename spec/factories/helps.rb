# frozen_string_literal: true

FactoryBot.define do
  factory :help do
    help_type { 'donation_food_clothes' }
    title { 'I need food donation' }
    description { 'My name is Jane Doe, I have 2 kids and have nothing to eat. Please help me with any kind of food.' }
    fullname { 'Jane Doe' }
    email { 'Jane.Doe@example.com' }
    cellphone { '924123457' }
    alternative_cellphone { '924123458' }
    province { 'Luanda' }
    county { 'Belas' }
    district { 'Kilamba' }
    neighborhood { 'Kilamba' }
    address { 'Rua A, Nº 123 - 2º ESQ' }
    status { :pending }

    trait :active do
      status { :active }
    end

    trait :inactive do
      status { :inactive }
    end

    trait :deleted do
      status { :deleted }
    end
  end
end
