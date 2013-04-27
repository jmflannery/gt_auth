module GtAuth

  class Administrator < ActiveRecord::Base
    has_secure_password

    attr_accessible :name, :password, :password_confirmation

    before_save :create_remember_token

    validates :name, uniqueness: true

    def as_json(options = {})
      { name: name,
        password: password,
        password_confirmation: password_confirmation }
    end

    private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
  end
end
