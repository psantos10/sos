# frozen_string_literal: true

class VolunteerHelp < ApplicationRecord
  enum status: { pending: 0, accepted: 1, declined: 2, canceled: 3 }

  belongs_to :volunteer
  belongs_to :help

  validates :volunteer_id, uniqueness: { scope: :help_id }
end

# == Schema Information
#
# Table name: volunteer_helps
#
#  id           :bigint           not null, primary key
#  anonymous    :boolean
#  status       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  help_id      :bigint           not null
#  volunteer_id :bigint           not null
#
# Indexes
#
#  index_volunteer_helps_on_help_id       (help_id)
#  index_volunteer_helps_on_volunteer_id  (volunteer_id)
#
# Foreign Keys
#
#  fk_rails_...  (help_id => helps.id)
#  fk_rails_...  (volunteer_id => volunteers.id)
#
