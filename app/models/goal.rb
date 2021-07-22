class Goal < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :cost
  belongs_to :savings
end
