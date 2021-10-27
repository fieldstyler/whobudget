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
    @groceries = Savings.expense_breakdown(month, year, "Groceries")
    @eat_out = Savings.expense_breakdown(month, year, "Eat Out")
    @housing = Savings.expense_breakdown(month, year, "Housing")
    @subscriptions = Savings.expense_breakdown(month, year, "Subscriptions")
    @loans = Savings.expense_breakdown(month, year, "Loans")
    @car = Savings.expense_breakdown(month, year, "Car")
    @phone = Savings.expense_breakdown(month, year, "Phone")
    @larry = Savings.expense_breakdown(month, year, "Larry")
    @entertainment = Savings.expense_breakdown(month, year, "Entertainment")
    @sports = Savings.expense_breakdown(month, year, "Sports")
    @health_beaut = Savings.expense_breakdown(month, year, "Health & Beauty")
    @gifts = Savings.expense_breakdown(month, year, "Gifts")
    @other_t = Savings.expense_breakdown(month, year, "Other T")
    @other_h = Savings.expense_breakdown(month, year, "Other H")
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
