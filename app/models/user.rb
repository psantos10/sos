# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :name, :email, :phone, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :phone, uniqueness: { case_sensitive: false }
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
