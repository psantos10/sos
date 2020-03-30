# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :name, :email, :phone, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :phone, uniqueness: { case_sensitive: false }
end
