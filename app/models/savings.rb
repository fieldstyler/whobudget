class Savings < ApplicationRecord
  validates_presence_of :amount
  has_many :goals
  has_many :expenses
end
