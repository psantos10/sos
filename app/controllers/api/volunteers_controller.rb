# frozen_string_literal: true

module API
  class VolunteersController < BaseController
    skip_before_action :require_authenticated_volunteer, only: %i[create auth]

    def create
      volunteer = Volunteer.new(volunteer_params)
      if volunteer.save
        render json: volunteer, status: :created
      else
        render json: volunteer.errors, status: :unprocessable_entity
      end
    end

    def auth
      volunteer = Volunteer.find_by(email: params[:auth][:email])
      if volunteer&.authenticate(params[:auth][:password])
        session[:volunteer_id] = volunteer.id
        render json: volunteer, status: :ok
      else
        session[:volunteer_id] = nil
        render json: { message: 'Authentication failed', code: 401 }, status: :unauthorized
      end
    end

    private

    def volunteer_params
      params.require(:volunteer).permit(:fullname, :email, :password, :cellphone, :province, :county, types_of_availability: [])
    end
  end
end
