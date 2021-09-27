class GoalController < ApplicationController
  def index
    @goals = Goal.all
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def show
    @goal = Goal.find(params[:id])
    @savings = Savings.find(@goal.savings_id)
    @percentage = (@goal.funds / @goal.cost) * 100
  end

  def update
    @goal = Goal.find(params[:id]).update(goal_params)
    redirect_to '/goal/index'
  end

  def destroy
    Goal.destroy(params[:id])
    redirect_to '/goal/index'
  end

  def new
  end

  def create
    savings = Savings.first
    @goal = savings.goals.create(goal_params)
    redirect_to "/goal/index"
  end

  def add
    goal = Goal.find(params[:id])
    savings = Savings.find(goal.savings_id)
    amount = params[:amount_to_add].to_f
    goal.add_funds(amount)
    redirect_to "/goal/#{goal.id}/show"
  end

  private
  def goal_params
    params.permit(:title, :cost)
  end
end
