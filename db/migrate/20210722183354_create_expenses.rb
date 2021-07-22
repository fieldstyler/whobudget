class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :title
      t.float :cost
      t.date :date
      t.string :category
      t.references :savings, foreign_key: true
    end
  end
end
