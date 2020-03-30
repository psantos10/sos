# frozen_string_literal: true

class VolunteerHelp < ApplicationRecord
  enum status: { pending: 0, accepted: 1, declined: 2, canceled: 3 }

  belongs_to :volunteer
  belongs_to :help

  validates :volunteer_id, uniqueness: { scope: :help_id }
end
