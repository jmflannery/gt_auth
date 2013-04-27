require 'spec_helper'

feature 'Administrator signs in' do

  scenario 'with correct name and password' do
    signin_with 'jeter', 'secret'

    expect(page).to have_content('Sign Out')
  end

  scenario 'with incorrect password' do
    signin_with 'jeter', 'incorrect'

    expect(page).to have_content('Sign In')
  end

  scenario 'with blank name and password' do
    signin_with '', ''

    expect(page).to have_content('Sign In')
  end
end
