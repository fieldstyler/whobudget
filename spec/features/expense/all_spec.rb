require 'rails_helper'

RSpec.describe "All Expenses Page" do
  before :each do
    @savings = Savings.create(amount: 56789.12)
    exp1 = @savings.expenses.create(title: "Taco Bell", cost: 12.56, date: "#{Date.today}", category: "Food")
    exp2 = @savings.expenses.create(title: "July Rent", cost: 200, date: "#{Date.today}", category: "Rent")
    exp3 = @savings.expenses.create(title: "Gas T Car", cost: 40.12, date: "#{Date.today}", category: "Car")
    exp4 = @savings.expenses.create(title: "Codenames", cost: 12.35, date: "#{Date.today}", category: "Entertainment")
    exp5 = @savings.expenses.create(title: "T Student Loan", cost: 450.20, date: "#{Date.today}", category: "Monthly Payments")
    exp6 = @savings.expenses.create(title: "Panda", cost: 24.87, date: "#{Date.today}", category: "Food")
    exp7 = @savings.expenses.create(title: "Doordash Red Robin", cost: 41.66, date: "#{Date.today}", category: "Food")
    exp8 = @savings.expenses.create(title: "Yum", cost: 50, date: "#{Date.today}", category: "Income")
    exp9 = @savings.expenses.create(title: "Weed Dom", cost: 100, date: "#{Date.today}", category: "Other")
    exp10 = @savings.expenses.create(title: "Taco Bell", cost: 12.56, date: "#{Date.today}", category: "Food")
    exp11 = @savings.expenses.create(title: "Taco Bellxxxx", cost: 12.56, date: "#{Date.today}", category: "Food")
    exp12 = @savings.expenses.create(title: "July Rentxxxx", cost: 200, date: "#{Date.today}", category: "Rent")
    exp13 = @savings.expenses.create(title: "Gas T Carxxxx", cost: 40.12, date: "#{Date.today}", category: "Car")
    exp14 = @savings.expenses.create(title: "Codenamesxxxx", cost: 12.35, date: "#{Date.today}", category: "Entertainment")
    exp15 = @savings.expenses.create(title: "T Student Loanxxxx", cost: 450.20, date: "#{Date.today}", category: "Monthly Payments")
    exp16 = @savings.expenses.create(title: "Pandaxxxx", cost: 24.87, date: "#{Date.today}", category: "Food")
    exp17 = @savings.expenses.create(title: "Doordash Red Robinxxxx", cost: 41.66, date: "#{Date.today}", category: "Food")
    exp18 = @savings.expenses.create(title: "Yumxxxx", cost: 50, date: "#{Date.today}", category: "Income")
    exp19 = @savings.expenses.create(title: "Weed Domxxxx", cost: 100, date: "#{Date.today}", category: "Other")
    exp20 = @savings.expenses.create(title: "Gas H Carxxxx", cost: 48.44, date: "#{Date.today}", category: "Car")
    @expenses = [exp1, exp2, exp3, exp4, exp5, exp6, exp7, exp8, exp9, exp10, exp11, exp12, exp13, exp14, exp15, exp16, exp17, exp18, exp19, exp20]
  end

  it 'visit View All Expenses Page' do
    visit '/expense/index'
    expect(page).to have_button("View All Expenses")
    click_on "View All Expenses"
    expect(current_path).to eq("/expense/all/index")
  end

  it 'has a list of all expenses' do
    visit '/expense/all/index'
    @expenses.each do |expense|
      expect(page).to have_content(expense.title)
      expect(page).to have_content(expense.cost)
      expect(page).to have_content(expense.date)
      expect(page).to have_content(expense.category)
    end
  end


end
