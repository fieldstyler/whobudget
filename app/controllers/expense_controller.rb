class ExpenseController < ApplicationController
  def new
  end


  def index
    @savings = Savings.first
    @expenses = Expense.all.order("date DESC").first(10)
  end

  def show
    month = params[:month]
    year = params[:year]
    @date = Date.new(year.to_i, month.to_i)
    @food = Savings.expense_breakdown(month, year, "Food")
    @entertainment = Savings.expense_breakdown(month, year, "Entertainment")
    @housing = Savings.expense_breakdown(month, year, "Housing")
    @car = Savings.expense_breakdown(month, year, "Car")
    @other = Savings.expense_breakdown(month, year, "Other")
    @income = Savings.expense_breakdown(month, year, "Income")
  end

  def create
    savings = Savings.first
    @expense = savings.expenses.create(expense_params)
    Savings.calculate_expense(@expense)
    redirect_to '/expense/index'
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @Expense = Expense.find(params[:id]).update(expense_params)
    redirect_to '/expense/index'
  end

  def destroy
    expense = Expense.find(params[:id])
    Savings.delete_expense(expense)
    Expense.destroy(params[:id])
    redirect_to '/expense/index'
  end

  def all
    @expenses = Expense.all.order("date DESC")
  end

  def search
  end

  def search_data
    month = params[:date][:month]
    year = params[:date][:year]
    redirect_to "/expense/show/#{month}/#{year}"
  end

  private
  def expense_params
    params.permit(:title, :cost, :date, :category)
  end
end
