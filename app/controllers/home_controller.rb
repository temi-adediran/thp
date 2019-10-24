class HomeController < ApplicationController
  skip_before_action :ensure_authentication

  def index
  end
end
