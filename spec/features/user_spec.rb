require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  scenario 'index page' do
    visit users_path
    expect(page).to have_content('User index')
  end
end
