class AddFundsToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :funds, :float, default: 0.0
  end
end
