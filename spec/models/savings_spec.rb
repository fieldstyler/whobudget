require 'rails_helper'

RSpec.describe Savings, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:amount)}
  end

  describe 'relationships' do
    it {should have_many(:expenses)}
    it {should have_many(:goals)}
  end

  it 'can find total monthly expenditures, incomes, and net' do
    Expense.destroy_all
    Savings.destroy_all
    @savings = Savings.create(amount: 10000)
    exp1 = @savings.expenses.create(title: "Taco Bell", cost: 12.56, date: "12/08/2021", category: "Food")
    exp2 = @savings.expenses.create(title: "July Rent", cost: 200, date: "13/08/2021", category: "Rent")
    exp3 = @savings.expenses.create(title: "H July Income", cost: 1600, date: "14/05/2021", category: "Income")
    exp4 = @savings.expenses.create(title: "June utilities", cost: 400, date: "14/05/2021", category: "Whatever")
    exp5 = @savings.expenses.create(title: "H August Income", cost: 2000, date: "14/08/2021", category: "Income")
    Savings.calculate_expense(exp1)
    Savings.calculate_expense(exp2)
    Savings.calculate_expense(exp3)
    Savings.calculate_expense(exp4)
    Savings.calculate_expense(exp5)
    @savings = Savings.first

    expect(@savings.current_monthly_expenditures).to eq(212.56)
    expect(@savings.current_monthly_income).to eq(2000)
    expect(@savings.net_current_monthly_income).to eq(1787.44)
    expect(@savings.amount).to eq(12987.44)
  end
end
