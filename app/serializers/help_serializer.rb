# frozen_string_literal: true

class HelpSerializer < ApplicationSerializer
  attributes :id, :help_type, :title, :description, :fullname, :province, :county, :district, :neighborhood, :address
end
