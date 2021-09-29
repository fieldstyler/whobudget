class WelcomeController < ApplicationController
  def index
    @savings = Savings.first
    @goals = Goal.all
  end
end
