require 'rails_helper'

RSpec.describe 'User', type: :feature do
  scenario 'index page' do
    visit user_path
    expect(page).to have_content('Hello, world!')
  end
end
