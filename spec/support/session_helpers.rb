module Features
  module SessionHelpers

    def register_with(name, password, password_confirmation)
      visit register_path
      fill_in :name, with: name
      fill_in :password, with: password
      fill_in :password_confirmation, with: password_confirmation
      click_button 'Register'
    end
  end
end
