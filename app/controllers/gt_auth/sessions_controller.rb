module GtAuth
  class SessionsController < ApplicationController

    def create
      admin = Administrator.find_by_name(params[:session][:name])
      if admin && admin.authenticate(params[:session][:password])
        sign_in admin
        render json: admin
      else
        render json: { error: 'Incorrect name or password' }
      end
    end
  end
end
