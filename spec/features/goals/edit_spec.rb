require 'rails_helper'

RSpec.describe "Goal Edit Page" do
  it "can visit form to edit goal" do
    savings = Savings.create(amount: 24355.23)
    hmoon = savings.goals.create(title: "Honeymoon", cost: 4000)
    visit "/goal/index"
    within "#goal-#{hmoon.id}" do
      click_on("Edit Goal")
    end
    expect(current_path).to eq("/goal/#{hmoon.id}/edit")
    expect(page).to have_content("Edit Your Goal")
    expect(page).to have_field(:title)
    expect(page).to have_field(:cost)
    expect(page).to have_button("Edit This Goal")
  end

  it "can edit goal item and redirects back to goal index page where edited amount or title is displayed" do
    savings = Savings.create(amount: 24355.23)
    hmoon = savings.goals.create(title: "Honeymoon", cost: 4000)
    visit "/goal/index"
    within "#goal-#{hmoon.id}" do
      click_on("Edit Goal")
    end
    fill_in 'Title', with: "Homneynoon"
    fill_in 'Cost', with: 3500
    click_on("Edit This Goal")
    expect(current_path).to eq("/goal/index")
    expect(page).to have_content("Homneynoon")
    expect(page).to_not have_content("Honeymoon")
    expect(page).to have_content("3500")
    expect(page).to_not have_content("4000")
  end
end
