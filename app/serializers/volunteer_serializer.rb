# frozen_string_literal: true

class VolunteerSerializer < ApplicationSerializer
  attributes :id, :fullname, :province, :county, :types_of_availability
end
