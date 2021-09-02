require 'rails_helper'

RSpec.describe "Welcome Page" do
  it 'has a welcome page' do
    visit root_path
    expect(page).to have_content("whobudget")
  end

  it 'has a button to add savings' do
    Expense.destroy_all
    Savings.destroy_all
    visit root_path
    expect(page).to have_button("Add Savings")
  end

  it 'displays the amount of money currently in savings' do
    Expense.destroy_all
    Savings.destroy_all
    savings = Savings.create(amount: 23456.78)
    visit root_path
    expect(page).to have_content("Current Savings")
    expect(page).to have_content("$23,456.78")
  end

  it 'has a button to edit savings amount' do
    Expense.destroy_all
    Savings.destroy_all
    visit root_path
    savings = Savings.create(amount: 4444.42)
    click_on("Add Savings")
    fill_in "Amount", with: savings.amount
    click_on("Create Savings")
    expect(page).to have_button("Edit Savings")
  end

  it 'has a list of all goals' do

  end

  it 'has a button to add goals' do

  end

  it 'has a button to delete goals next to each goal' do

  end

  it 'successfully deletes goals when you click the delete goal button' do

  end

  it 'has a button to view expense report' do
    visit root_path
    expect(page).to have_button("Expense Report")
  end

  it 'has a button to add expense' do
    visit root_path
    expect(page).to have_button("Add Expense")
  end

  it 'takes you to a create savings page when you click the add savings button' do
    Expense.destroy_all
    Savings.destroy_all
    visit root_path
    click_on("Add Savings")
    expect(current_path).to eq('/savings/new')
  end

  it 'takes you to a create goal page when you click the add goal button' do

  end
end
