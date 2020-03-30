# frozen_string_literal: true

class Help < ApplicationRecord
  enum status: { pending: 0, active: 1, inactive: 2, deleted: 3 }

  validates :help_type, :title, :description, presence: true
  validates :fullname, :email, :cellphone, :province, :county, :district, :neighborhood, :address, presence: true
end
