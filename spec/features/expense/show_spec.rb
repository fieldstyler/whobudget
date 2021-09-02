require 'rails_helper'

RSpec.describe "Expense Show Page" do
  before :each do
    Expense.destroy_all
    Savings.destroy_all
    @savings = Savings.create(amount: 56789.12)
    exp1 = @savings.expenses.create(title: "Taco Bell", cost: 12.56, date: "#{Date.today}", category: "Food")
    exp2 = @savings.expenses.create(title: "July Rent", cost: 200, date: "#{Date.today}", category: "Housing")
    exp3 = @savings.expenses.create(title: "Gas T Car", cost: 40.12, date: "#{Date.today}", category: "Car")
    exp4 = @savings.expenses.create(title: "Codenames", cost: 12.35, date: "#{Date.today}", category: "Entertainment")
    exp5 = @savings.expenses.create(title: "T Student Loan", cost: 450.20, date: "#{Date.today}", category: "Other")
    exp6 = @savings.expenses.create(title: "Panda", cost: 24.87, date: "#{Date.today}", category: "Food")
    exp7 = @savings.expenses.create(title: "Doordash Red Robin", cost: 41.66, date: "#{Date.today}", category: "Food")
    exp8 = @savings.expenses.create(title: "H Income August", cost: 999, date: "#{Date.today}", category: "Income")
    exp9 = @savings.expenses.create(title: "Weed Dom", cost: 100, date: "#{Date.today}", category: "Other")
    exp10 = @savings.expenses.create(title: "Gas H Car", cost: 48.44, date: "#{Date.today}", category: "Car")
  end

  it 'has a title' do
    visit "/expense/show/#{Date.today.month}/#{Date.today.year}"
    expect(page).to have_content("#{Date.today.strftime("%B")} #{Date.today.year} Expense Breakdown")
  end

  it 'groups expenses by category' do
  end
end
