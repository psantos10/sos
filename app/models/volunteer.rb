# frozen_string_literal: true

class Volunteer < ApplicationRecord
  has_secure_password
  serialize :types_of_availability, Array

  validates :fullname, :email, :cellphone, :province, :county, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :cellphone, uniqueness: true

  has_many :volunteer_helps, dependent: :destroy
  has_many :helps, through: :volunteer_helps
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
