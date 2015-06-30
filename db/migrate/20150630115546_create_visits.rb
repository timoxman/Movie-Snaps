class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :description
      t.date :date_visited
    end
  end
end
