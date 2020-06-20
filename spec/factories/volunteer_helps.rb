# frozen_string_literal: true

FactoryBot.define do
  factory :volunteer_help do
    volunteer { create(:volunteer) }
    help { create(:help) }
    anonymous { false }
    status { :pending }

    trait :anonymous do
      anonymous { true }
    end

    trait :accepted do
      status { :accepted }
    end

    trait :declined do
      status { :declined }
    end

    trait :canceled do
      status { :canceled }
    end
  end
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
#  index_volunteer_helps_on_help_id                   (help_id)
#  index_volunteer_helps_on_volunteer_id              (volunteer_id)
#  index_volunteer_helps_on_volunteer_id_and_help_id  (volunteer_id,help_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (help_id => helps.id)
#  fk_rails_...  (volunteer_id => volunteers.id)
#
