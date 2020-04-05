# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    email { 'jdoe@sosangola.me' }
    phone { '922121314' }
    password_digest { 'passwordsecret' }
  end
end

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  phone           :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#  index_users_on_phone  (phone) UNIQUE
#
