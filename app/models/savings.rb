class Savings < ApplicationRecord
  validates_presence_of :amount
  has_many :goals
  has_many :expenses
  serialize :monthly_savings

  def self.calculate_expense(expense)
    if expense.category == "Income"
      new_amount = Savings.first.amount += expense.cost
      Savings.first.update(amount: new_amount)
    else
      new_amount = Savings.first.amount -= expense.cost
      Savings.first.update(amount: new_amount)
    end
  end

  def self.delete_expense(expense)
    if expense.category == "Income"
      new_amount = Savings.first.amount -= expense.cost
      Savings.first.update(amount: new_amount)
    else
      new_amount = Savings.first.amount += expense.cost
      Savings.first.update(amount: new_amount)
    end
  end

  def current_monthly_expenditures
    beginning = Date.today.beginning_of_month
    end_of_month = Date.today.end_of_month
    expenses = Expense.where(date: beginning..end_of_month).where.not(category: "Income")
    expenses.sum do |expense|
      expense.cost
    end
  end

  def current_monthly_income
    beginning = Date.today.beginning_of_month
    end_of_month = Date.today.end_of_month
    incomes = Expense.where(date: beginning..end_of_month).where(category: "Income")
    incomes.sum do |expense|
      expense.cost
    end
  end

  def net_current_monthly_income
    current_monthly_income - current_monthly_expenditures
  end

  def last_month_savings
    last_month_start = Date.today.last_month.beginning_of_month
    last_month_end = Date.today.last_month.end_of_month
    this_month_incomes = Expense.where(date: last_month_start..last_month_end).where(category: "Income")
    this_month_expenses = Expense.where(date: last_month_start..last_month_end).where.not(category: "Income")
    this_month_incomes = this_month_incomes.sum do |income|
      income.cost
    end
    this_month_expenses = this_month_expenses.sum do |expense|
      expense.cost
    end
    this_month_incomes - this_month_expenses
  end

  def last_year_savings
    last_year_start = Date.today.last_year.beginning_of_year
    last_year_end = Date.today.last_year.end_of_year
    this_year_incomes = Expense.where(date: last_year_start..last_year_end).where(category: "Income")
    this_year_expenses = Expense.where(date: last_year_start..last_year_end).where.not(category: "Income")
    this_year_incomes = this_year_incomes.sum do |income|
      income.cost
    end
    this_year_expenses = this_year_expenses.sum do |expense|
      expense.cost
    end
    this_year_incomes - this_year_expenses
  end

  def self.expense_breakdown(month, year, category)
    date = Date.new(year.to_i, month.to_i)
    end_of_month = date.end_of_month
    Expense.where(category: category).where(date: date..end_of_month).order("date DESC")
  end

  def restore_funds(amount)
    amount = self.amount + amount
    Savings.find(self.id).update(amount: amount)
  end
end
