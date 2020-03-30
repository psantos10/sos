# frozen_string_literal: true

class Volunteer < ApplicationRecord
  has_secure_password
  serialize :types_of_availability, Array

  validates :fullname, :email, :cellphone, :province, :county, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :cellphone, uniqueness: true
end
