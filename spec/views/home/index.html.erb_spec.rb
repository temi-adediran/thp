require 'rails_helper'

RSpec.describe "home/index", type: :view do
  it "displays the user index page" do
    render
    expect(rendered).to include("Haven Portal")
  end
end
