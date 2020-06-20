# frozen_string_literal: true

FactoryBot.define do
  factory :province do
    sequence(:name) { |n| "Luanda#{n}" }
  end
end

# == Schema Information
#
# Table name: provinces
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_provinces_on_name  (name) UNIQUE
#
