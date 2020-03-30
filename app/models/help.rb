# frozen_string_literal: true

class Help < ApplicationRecord
  HELP_TYPES = {
    donation_food_clothes: 'Doação (Alimentação e Vestuário)',
    donation_medicines_gloves_alcogol_gel_masks: 'Doação (Medicamentos, Luvas, Máscaras, Alcool-Gel)',
    psychological_support: 'Apóio Psicológico',
    transport_to_or_from_hospital: 'Transporte para Hospital',
    going_to_shop_or_farmacy: 'Compras (Super-mercado ou Farmácias)',
    other: 'Outros'
  }.freeze

  enum status: { pending: 0, active: 1, inactive: 2, deleted: 3 }

  validates :help_type, :title, :description, presence: true
  validates :fullname, :email, :cellphone, :province, :county, :district, :neighborhood, :address, presence: true
  validates :help_type, inclusion: { in: HELP_TYPES.keys.map(&:to_s) }
end
