require 'rails_helper'

RSpec.describe Savings, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:amount)}
  end

  describe 'relationships' do
    it {should have_many(:expenses)}
    it {should have_many(:goals)}
  end
end
