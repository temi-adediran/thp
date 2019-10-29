require 'rails_helper'

RSpec.describe 'Home', type: :feature do
  scenario 'index page' do
    visit root_path
    expect(page).to have_content('The Haven')
  end
end
