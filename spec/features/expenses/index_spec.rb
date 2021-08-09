require 'rails_helper'

RSpec.describe "Expense Report Page" do
  before :each do
    @savings = Savings.create(amount: 56789.12)
    exp1 = @savings.expenses.create(title: "Taco Bell", cost: 12.56, date: "12/03/2021", category: "Food")
    exp2 = @savings.expenses.create(title: "July Rent", cost: 200, date: "13/03/2021", category: "Rent")
    exp3 = @savings.expenses.create(title: "Gas T Car", cost: 40.12, date: "14/03/2021", category: "Car")
    exp4 = @savings.expenses.create(title: "Codenames", cost: 12.35, date: "15/03/2021", category: "Entertainment")
    exp5 = @savings.expenses.create(title: "T Student Loan", cost: 450.20, date: "16/03/2021", category: "Monthly Payments")
    exp6 = @savings.expenses.create(title: "Panda", cost: 24.87, date: "17/03/2021", category: "Food")
    exp7 = @savings.expenses.create(title: "Doordash Red Robin", cost: 41.66, date: "18/03/2021", category: "Food")
    exp8 = @savings.expenses.create(title: "Yum", cost: 50, date: "19/03/2021", category: "Food")
    exp9 = @savings.expenses.create(title: "Weed Dom", cost: 100, date: "20/03/2021", category: "Other")
    exp10 = @savings.expenses.create(title: "Gas H Car", cost: 48.44, date: "21/03/2021", category: "Car")
    @expenses = Expense.all.order("date DESC").first(10)
  end

  it 'has a title' do
    visit '/expense/index'
    expect(page).to have_content('Your Expense Report')
  end

  it 'has a list of ten most recent expenses' do
    visit '/expense/index'
    @expenses.each do |exp|
      expect(page).to have_content(exp.title)
      expect(page).to have_content(exp.cost)
      expect(page).to have_content(exp.category)
      expect(exp.date.month).to eq(3)
    end
    expect(@expenses.count).to eq(10)
  end

  it 'displays the total monthly expenses' do
    visit '/expense/index'
    expect(page).to have_content("Money Spent This Month")
    expect(page).to have_content(@savings.monthly_expenditures)
  end

  it 'displays the total monthly income' do
    visit '/expense/index'
    expect(page).to have_content("Money Made This Month")
    expect(page).to have_content(@savings.monthly_income)
  end

  it 'has a button to add expense' do
    visit '/expense/index'
    expect(page).to have_button("Add Expense")
  end

  it 'has a button to edit expense' do
    visit '/expense/index'
    expect(page).to have_button("Edit Expense")
  end

  it 'has a button to view all expenses under ten most recent' do
    visit '/expense/index'
    expect(page).to have_button("View All Expenses")
  end
end
