class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title
      t.float :cost
      t.references :savings, foreign_key: true
    end
  end
end
