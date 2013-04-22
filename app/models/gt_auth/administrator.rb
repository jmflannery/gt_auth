module GtAuth
  class Administrator < ActiveRecord::Base
    has_secure_password

    attr_accessible :name, :password, :password_confirmation

    validates :name, uniqueness: true

    def as_json(options = {})
      { name: name,
        password: password,
        password_confirmation: password_confirmation }
    end
  end
end
