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
end
