# frozen_string_literal: true

module API
  class BaseController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    private

    def record_not_found(exception)
      render json: { message: "Registo com ID #{exception.id} não encontrado.", code: 'not_found' }, status: :not_found
    end
  end
end
