# frozen_string_literal: true

class VolunteerSerializer < ApplicationSerializer
  attributes :id, :fullname, :email, :cellphone, :province, :county, :types_of_availability
end
