require 'rails_helper'

RSpec.describe "Create Goal Page" do
  it "has form to create a goal" do
    visit "/goal/new"

    expect(page).to have_field(:title)
    expect(page).to have_field(:cost)
    expect(page).to have_button("Add Goal")
  end

  it "can create savings item and redirects back to welcome page where goal is displayed" do
    Savings.create(amount: 25000)
    title = "Honeymoon"
    cost = 4000
    visit root_path
    click_on("Add Goal")
    expect(current_path).to eq("/goal/new")

    fill_in 'Title', with: title
    fill_in 'Cost', with: cost
    click_on("Add Goal")

    expect(current_path).to eq("/goal/index")
    expect(page).to have_content(title)
    expect(page).to have_content("$4,000.00")
  end
end
