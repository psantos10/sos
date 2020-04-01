# frozen_string_literal: true

module API
  class HelpsController < ApplicationController
    def create
      help = Help.new(help_params)
      if help.save
        render json: help, status: :created
      else
        render json: help.errors, status: :unprocessable_entity
      end
    end

    private

    def help_params
      params.require(:help).permit(
        :help_type,
        :title,
        :description,
        :fullname,
        :email,
        :cellphone,
        :alternative_cellphone,
        :province,
        :county,
        :district,
        :neighborhood,
        :address
      )
    end
  end
end
