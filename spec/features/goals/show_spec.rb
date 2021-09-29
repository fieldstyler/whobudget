require 'rails_helper'

RSpec.describe "Goal Show Page" do
  before :each do
    Expense.destroy_all
    Goal.destroy_all
    Savings.destroy_all
    @savings = Savings.create(amount: 56789.12)
    @goal1 = @savings.goals.create(title: "Honeymoon", cost: 4000)
  end

  it 'has a title' do
    visit "/goal/#{@goal1.id}/show"
    expect(page).to have_content(@goal1.title)
  end

  it 'has a button to add funds towards goal' do
    visit "/goal/#{@goal1.id}/show"
    expect(page).to have_button("Add Funds")
  end

  it 'adds funds when you click Add Funds button' do
    visit "/goal/#{@goal1.id}/show"
    expect(page).to have_content("$0.00")
    expect(page).to have_content("$4,000.00")
    expect(page).to have_content("$56,789.12")
    fill_in :amount_to_add, with: 1000
    click_on "Add Funds"
    expect(current_path).to eq("/goal/#{@goal1.id}/show")
    expect(page).to have_content("$1,000.00")
    expect(page).to have_content("$4,000.00")
    expect(page).to have_content("$55,789.12")
  end

  it 'funds will never exceed goal amount' do
    visit "/goal/#{@goal1.id}/show"
    expect(page).to have_content("$0.00")
    expect(page).to have_content("$4,000.00")
    expect(page).to have_content("$56,789.12")
    fill_in :amount_to_add, with: 4500
    click_on "Add Funds"
    expect(current_path).to eq("/goal/#{@goal1.id}/show")
    expect(page).to have_content("$4,000.00")
    expect(page).to have_content("$52,789.12")
  end
end
