class Expense < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :cost
  validates_presence_of :date
  validates_presence_of :category
  belongs_to :savings

  def month_year
    array = []
    array << date.month
    array << date.year
    return array
  end
end
