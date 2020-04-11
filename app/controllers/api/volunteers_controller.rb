# frozen_string_literal: true

module API
  class VolunteersController < BaseController
    def create
      volunteer = Volunteer.new(volunteer_params)
      if volunteer.save
        render json: volunteer, status: :created
      else
        render json: volunteer.errors, status: :unprocessable_entity
      end
    end

    private

    def volunteer_params
      params.require(:volunteer).permit(:fullname, :email, :password, :cellphone, :province, :county, types_of_availability: [])
    end
  end
end
