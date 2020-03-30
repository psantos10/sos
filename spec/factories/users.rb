# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    email { 'jdoe@sosangola.me' }
    phone { '922121314' }
    password_digest { 'passwordsecret' }
  end
end
