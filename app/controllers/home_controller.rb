class HomeController < ApplicationController
  def index
    if user_signed_in?
      @pets = current_user.pets
    else
      @pets = []
    end
  end
end