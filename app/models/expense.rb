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

  def self.check_for_duplicates(month, year, category)
    date = Date.new(year.to_i, month.to_i)
    end_of_month = date.end_of_month
    expenses = Expense.where(category: category).where(date: date..end_of_month).pluck(:cost, :date)
    expenses.size != expenses.uniq.size ? true : false
  end
end
