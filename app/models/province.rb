# frozen_string_literal: true

class Province < ApplicationRecord
  validates :name, uniqueness: true
end

# == Schema Information
#
# Table name: provinces
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_provinces_on_name  (name) UNIQUE
#
