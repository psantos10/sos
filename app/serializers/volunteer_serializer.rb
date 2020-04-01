# frozen_string_literal: true

class VolunteerSerializer < ApplicationSerializer
  attributes :id, :fullname, :province, :county, :types_of_availability
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
