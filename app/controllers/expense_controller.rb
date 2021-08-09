class ExpenseController < ApplicationController
  def new

  end

  def index
    @savings = Savings.first
    @expenses = Expense.all.order("date DESC")
  end

  def create
    savings = Savings.first
    @expense = savings.expenses.create(expense_params)
    redirect_to '/expense/index'
  end
  # savings.update_expense

  private
  def expense_params
    params.permit(:title, :cost, :date, :category)
  end
end
