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
