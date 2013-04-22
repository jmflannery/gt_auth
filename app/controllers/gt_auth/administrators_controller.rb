module GtAuth

  class AdministratorsController < ApplicationController

    def create
      render json: Administrator.create(params[:administrator])
    end
  end
end
