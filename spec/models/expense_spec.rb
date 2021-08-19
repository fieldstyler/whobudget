require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:cost)}
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:category)}
  end

  describe 'relationships' do
    it {should belong_to(:savings)}
  end

  it 'can call month and year of expense' do
    @savings = Savings.create(amount: 56789.12)
    exp1 = @savings.expenses.create(title: "Taco Bell", cost: 12.56, date: "12/03/2021", category: "Food")
    exp2 = @savings.expenses.create(title: "July Rent", cost: 200, date: "13/03/2021", category: "Rent")

    expect(exp1.month_year).to eq([3, 2021])
    expect(exp2.month_year).to eq([3, 2021])
  end
end
