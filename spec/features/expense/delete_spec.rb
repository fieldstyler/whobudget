require 'rails_helper'

RSpec.describe "Expense Destroy Test" do
  it "deletes item when you click the Big X!" do
    Expense.destroy_all
    Savings.destroy_all
    savings = Savings.create(amount: 24355.23)
    exp = Expense.create(title: "Hot Dog", cost: 3.01, date: "#{Date.today}", category: "Food", savings_id: "#{savings.id}")
    visit "/expense/index"

    expect(page).to have_content(exp.title)
    expect(page).to have_content(exp.cost)
    within "#expense-#{exp.id}" do
      click_on("X")
    end
    expect(current_path).to eq("/expense/index")
    expect(page).to_not have_content(exp.title)
    expect(page).to_not have_content(exp.cost)
  end
end
