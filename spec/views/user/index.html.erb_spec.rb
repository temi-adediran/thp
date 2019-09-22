require 'rails_helper'

RSpec.describe "user/index", type: :view do
  it "displays the user index page" do
    render
    expect(rendered).to include("Hello, world!")
  end
end
