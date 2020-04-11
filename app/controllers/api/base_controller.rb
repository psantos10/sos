# frozen_string_literal: true

module API
  class BaseController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    before_action :require_authenticated_volunteer

    def current_volunteer
      return nil unless session[:volunteer_id]

      @current_volunteer ||= Volunteer.find(session[:volunteer_id])
    end

    def require_authenticated_volunteer
      return if current_volunteer

      render json: { message: 'Authentication required', code: 401 }, status: :unauthorized
    end

    private

    def record_not_found(exception)
      render json: { message: "Registo com ID #{exception.id} não encontrado.", code: 'not_found' }, status: :not_found
    end
  end
end
