module GtAuth
  module SessionsHelper

    def sign_in(admin)
      cookies.permanent[:remember_token] = admin.id
      self.current_admin = admin
    end

    def current_admin=(admin)
      @current_admin = admin
    end

    def current_admin
      @current_admin ||= Administrator.find(cookies[:remember_token])
    end
  end
end
