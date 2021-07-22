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
end
