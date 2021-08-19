require 'rails_helper'

RSpec.describe "Expense Edit Page" do
  it "can visit form to edit expense" do
    savings = Savings.create(amount: 24355.23)
    exp = savings.expenses.create(title: "Hot Dog", cost: 3.01, date: "#{Date.today}", category: "Food")
    visit "/expense/index"
    within "#expense-#{exp.id}" do
      click_on("Edit")
    end
    expect(current_path).to eq("/expense/#{exp.id}/edit")
    expect(page).to have_content("Edit Your Expense")
    expect(page).to have_field(:title)
    expect(page).to have_field(:cost)
    expect(page).to have_field(:date)
    expect(page).to have_field(:category)
    expect(page).to have_button("Edit This Expense")
  end

  it "can edit expense item and redirects back to expense index page where edited amount is displayed" do
    savings = Savings.create(amount: 24355.23)
    exp = Expense.create(title: "Hot Dog", cost: 3.01, date: "#{Date.today}", category: "Food", savings_id: savings.id)
    visit "/expense/index"
    within "#expense-#{exp.id}" do
      click_on("Edit")
    end
    fill_in 'Cost', with: 3.51
    click_on("Edit This Expense")
    expect(current_path).to eq("/expense/index")
    expect(page).to have_content("3.51")
    expect(page).to_not have_content("3.01")
  end
end
