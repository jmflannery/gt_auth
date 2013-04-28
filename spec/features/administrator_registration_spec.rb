require 'spec_helper'

feature 'Administrator registration' do

  scenario 'with name and password and matching password confirmation' do
    register_with 'jeter', 'secret', 'secret'
  end
end
