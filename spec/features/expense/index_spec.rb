require 'rails_helper'

RSpec.describe "Expense Report Page" do
  before :each do
    Expense.destroy_all
    Savings.destroy_all
    @savings = Savings.create(amount: 56789.12)
    exp1 = @savings.expenses.create(title: "Taco Bell", cost: 12.56, date: "#{Date.today}", category: "Food")
    exp2 = @savings.expenses.create(title: "July Rent", cost: 200, date: "#{Date.today}", category: "Rent")
    exp3 = @savings.expenses.create(title: "Gas T Car", cost: 40.12, date: "#{Date.today}", category: "Car")
    exp4 = @savings.expenses.create(title: "Codenames", cost: 12.35, date: "#{Date.today}", category: "Entertainment")
    exp5 = @savings.expenses.create(title: "T Student Loan", cost: 450.20, date: "#{Date.today}", category: "Monthly Payments")
    exp6 = @savings.expenses.create(title: "Panda", cost: 24.87, date: "#{Date.today}", category: "Food")
    exp7 = @savings.expenses.create(title: "Doordash Red Robin", cost: 41.66, date: "#{Date.today}", category: "Food")
    exp8 = @savings.expenses.create(title: "H Income August", cost: 999, date: "#{Date.today}", category: "Income")
    exp9 = @savings.expenses.create(title: "Weed Dom", cost: 100, date: "#{Date.today}", category: "Other")
    exp10 = @savings.expenses.create(title: "Gas H Car", cost: 48.44, date: "#{Date.today}", category: "Car")
    @expenses = Expense.all.order("date DESC").first(10)
  end

  it 'has a title' do
    visit '/expense/index'
    expect(page).to have_content("#{Date.today.strftime("%B")} Expense Report")
  end

  it 'has a list of ten most recent expenses' do
    visit '/expense/index'
    @expenses.each do |exp|
      expect(page).to have_content(exp.title)
      expect(page).to have_content(exp.cost)
      expect(exp.date.month).to eq(Date.today.month)
    end
    expect(@expenses.count).to eq(10)
  end

  it 'displays the total monthly expenses' do
    visit '/expense/index'
    expect(page).to have_content("Money Spent This Month")
    expect(page).to have_content(@savings.current_monthly_expenditures.round(2))
  end

  it 'displays the total monthly income' do
    visit '/expense/index'
    expect(page).to have_content("Money Made This Month")
    expect(page).to have_content(@savings.current_monthly_income.round(2))
  end

  it 'displays the net monthly income' do
    visit '/expense/index'
    expect(page).to have_content("Net Money This Month")
    expect(page).to have_content(@savings.net_current_monthly_income.round(2))
  end

  it 'has a button to add expense' do
    visit '/expense/index'
    expect(page).to have_button("Add Expense")
  end

  it 'has a button to delete expense' do
    visit '/expense/index'
    expect(page).to have_button("X")
  end

  it 'has a button to edit expense' do
    visit '/expense/index'
    expect(page).to have_button("Edit")
  end

  it 'has a button to view all expenses under ten most recent' do
    visit '/expense/index'
    expect(page).to have_button("View All Expenses")
  end
end
