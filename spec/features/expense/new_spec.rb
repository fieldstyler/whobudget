require 'rails_helper'

RSpec.describe "Create Expense Page" do
  it "has form to create an expense" do
    visit "/expense/new"

    expect(page).to have_field(:title)
    expect(page).to have_field(:cost)
    expect(page).to have_field(:date)
    expect(page).to have_field(:category)
    expect(page).to have_button("Create Expense")
  end

  it "can create savings item and redirects back to welcome page where savings amount is displayed" do
    Savings.create(amount: 25000)
    title = "Ham Sandwich"
    cost = 2.82
    date = "#{Date.today}"

    visit "/expense/new"

    fill_in 'Title', with: title
    fill_in 'Cost', with: cost
    fill_in 'Date', with: date
    choose(option: 'Food')
    click_on("Create Expense")

    expect(current_path).to eq("/expense/index")
    expect(page).to have_content("#{title}")
    expect(page).to have_content("#{cost}")
    expect(page).to have_button("Add Expense")
  end
end
