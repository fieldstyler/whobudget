require 'rails_helper'

RSpec.describe Savings, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:amount)}
  end

  describe 'relationships' do
    it {should have_many(:expenses)}
    it {should have_many(:goals)}
  end

  before :each do
    Expense.destroy_all
    Savings.destroy_all
    @savings = Savings.create(amount: 10000)
    exp1 = @savings.expenses.create(title: "Taco Bell", cost: 12.56, date: "12/08/2021", category: "Food")
    exp2 = @savings.expenses.create(title: "August Rent", cost: 200, date: "13/08/2021", category: "Rent")
    exp3 = @savings.expenses.create(title: "H July Income", cost: 1600, date: "14/05/2021", category: "Income")
    exp4 = @savings.expenses.create(title: "June utilities", cost: 400, date: "14/05/2021", category: "Whatever")
    exp5 = @savings.expenses.create(title: "H August Income", cost: 2000, date: "14/08/2021", category: "Income")
    exp6 = @savings.expenses.create(title: "Red Robin", cost: 12.56, date: "12/07/2021", category: "Food")
    exp7 = @savings.expenses.create(title: "July Rent", cost: 200, date: "13/07/2021", category: "Rent")
    exp8 = @savings.expenses.create(title: "H Income July", cost: 1612.56, date: "14/07/2021", category: "Income")
    exp9 = @savings.expenses.create(title: "Poker", cost: 400, date: "15/07/2021", category: "Whatever")
    exp10 = @savings.expenses.create(title: "T Income July", cost: 2000, date: "16/07/2021", category: "Income")
    exp11 = @savings.expenses.create(title: "T Income July", cost: 2500, date: "16/07/2020", category: "Income")
    exp12 = @savings.expenses.create(title: "Treat Yo Self", cost: 2000, date: "16/09/2020", category: "Other")
    @expenses = Expense.all
    @expenses.each do |expense|
      Savings.calculate_expense(expense)
    end
    @savings = Savings.first
  end

  it 'can find total monthly expenditures, incomes, and net' do
  end

  it 'can find last months savings' do
  end

  it 'can find last years savings' do
  end
end
