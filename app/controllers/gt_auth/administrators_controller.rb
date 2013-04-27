module GtAuth

  class AdministratorsController < ApplicationController

    def create
      admin = Administrator.new(params[:administrator])
      if admin.save
        render json: admin
      else
        render json: { error: "Invalid attributes" }
      end
    end
  end
end
