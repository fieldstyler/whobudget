class WelcomeController < ApplicationController
  def index
    @savings = Savings.first
  end
end
