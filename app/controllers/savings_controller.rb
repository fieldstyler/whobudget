class SavingsController < ApplicationController
  def new
  end

  def create
    @savings = Savings.create(savings_params)
    redirect_to '/'
  end

  def edit
  end

  def update
    @savings = Savings.update(savings_params)
    redirect_to '/'
  end

  private
  def savings_params
    params.permit(:amount)
  end
end
