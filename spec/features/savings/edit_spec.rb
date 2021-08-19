require 'rails_helper'

RSpec.describe "Savings Edit Page" do
  it "has form to edit savings" do
    savings = Savings.create(amount: 24355.23)
    visit "/savings/#{savings.id}/edit"

    expect(page).to have_content("Edit Your Savings")
    expect(page).to have_field(:amount)
    expect(page).to have_button("Submit New Savings")
  end

  it "can edit savings item and redirects back to welcome page where edited savings amount is displayed" do
    amount = 22346.18

    visit "/savings/new"
    fill_in 'Amount', with: amount
    click_on("Create Savings")
    expect(page).to have_button("Edit Savings")
    expect(page).to_not have_button("Create Savings")
    savings = Savings.first
    click_on("Edit Savings")
    expect(current_path).to eq("/savings/#{savings.id}/edit")
    new_amount = 24355.23
    expect(page).to have_field('Amount')
    fill_in 'Amount', with: new_amount
    click_on("Submit New Savings")
    expect(current_path).to eq(root_path)
    expect(page).to have_content("$24,355.23")
  end
end
