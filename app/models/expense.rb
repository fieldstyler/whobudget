class Expense < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :cost
  validates_presence_of :date
  validates_presence_of :category
  belongs_to :savings
end
