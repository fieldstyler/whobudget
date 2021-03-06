require 'rails_helper'

RSpec.describe "Savings Create Page" do
  it "has form to create savings" do
    visit "/savings/new"

    expect(page).to have_field(:amount)
    expect(page).to have_button("Create Savings")
  end

  it "can create savings item and redirects back to welcome page where savings amount is displayed" do
    Expense.destroy_all
    Savings.destroy_all
    amount = 22346.18

    visit "/savings/new"

    fill_in 'Amount', with: amount
    click_on("Create Savings")

    expect(current_path).to eq(root_path)
    expect(page).to have_content("$22,346.18")
    expect(page).to have_button("Edit Savings")
    expect(page).to_not have_button("Create Savings")
  end
end
