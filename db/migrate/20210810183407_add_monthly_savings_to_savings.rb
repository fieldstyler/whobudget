class AddMonthlySavingsToSavings < ActiveRecord::Migration[5.2]
  def change
    add_column :savings, :monthly_savings, :text
  end
end
