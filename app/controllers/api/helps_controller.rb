# frozen_string_literal: true

module API
  class HelpsController < ApplicationController
    def index
      helps = Help.paginate(page: params[:page], per_page: params[:per_page] || 10).order('updated_at DESC')
      render json: helps, meta: meta_attributes(helps), status: :ok
    end

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

    def meta_attributes(collection, extra_meta = {})
      {
        current_page: collection.current_page,
        total_pages: collection.total_pages,
        total_count: collection.total_entries
      }.merge(extra_meta)
    end
  end
end
