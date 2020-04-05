# frozen_string_literal: true

class HelpSerializer < ApplicationSerializer
  attributes :id, :type, :title, :description, :fullname, :province, :county, :district

  def type
    Help::HELP_TYPES[object.help_type.to_sym]
  end
end

# == Schema Information
#
# Table name: helps
#
#  id                    :bigint           not null, primary key
#  address               :string
#  alternative_cellphone :string
#  cellphone             :string
#  county                :string
#  description           :text
#  district              :string
#  email                 :string
#  fullname              :string
#  help_type             :string
#  neighborhood          :string
#  province              :string
#  status                :integer
#  title                 :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_helps_on_email   (email)
#  index_helps_on_status  (status)
#
