require 'rails_helper'

RSpec.describe "Goal Index Page" do
  it "displays all goals" do
    savings = Savings.create(amount: 25000)
    hmoon = savings.goals.create(title: "Honeymoon", cost: 4000)
    speakers = savings.goals.create(title: "Car Speakers", cost: 250)
    visit "/goal/index"

    expect(page).to have_content(hmoon.title)
    expect(page).to have_content(hmoon.cost)
    expect(page).to have_content(speakers.title)
    expect(page).to have_content(speakers.cost)
  end

  it "should have an add goal button that takes you to a form and redirects" do
    savings = Savings.create(amount: 25000)
    hmoon = savings.goals.create(title: "Honeymoon", cost: 4000)
    speakers = savings.goals.create(title: "Car Speakers", cost: 250)
    visit "/goal/index"
    expect(page).to have_button("Add Goal")
    click_on "Add Goal"
    expect(current_path).to eq("/goal/new")
    fill_in :title, with: "Shoes"
    fill_in :cost, with: 120
    click_on "Add Goal"
    expect(current_path).to eq("/goal/index")
  end

  it "should have an edit and delete button next to each goal" do
    savings = Savings.create(amount: 25000)
    hmoon = savings.goals.create(title: "Honeymoon", cost: 4000)
    visit "/goal/index"
    within "#goal-#{hmoon.id}" do
      expect(page).to have_button("Edit Goal")
      expect(page).to have_button("Delete Goal")
    end
  end

  it "removes goal when you click the Delete Goal button" do
    savings = Savings.create(amount: 25000)
    hmoon = savings.goals.create(title: "Honeymoon", cost: 4000)
    visit "/goal/index"
    within "#goal-#{hmoon.id}" do
      click_on "Delete Goal"
    end
    expect(current_path).to eq('/goal/index')
    expect(page).to_not have_content("Honeymoon")
    expect(page).to_not have_content("4000")
  end
end
