class Goal < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :cost
  validates_presence_of :funds
  belongs_to :savings

  def add_funds(amount)
    if self.funds + amount > self.cost
      savings = Savings.find(self.savings_id)
      diff = self.funds + amount - self.cost
      self.funds += amount
      self.funds -= diff
      savings.amount -= amount
      savings.amount += diff
      Savings.find(self.savings_id).update(amount: savings.amount)
      Goal.find(self.id).update(funds: self.funds)
    else
      savings = Savings.find(self.savings_id)
      self.funds += amount
      savings.amount -= amount
      Savings.find(self.savings_id).update(amount: savings.amount)
      Goal.find(self.id).update(funds: self.funds)
    end
  end
end
