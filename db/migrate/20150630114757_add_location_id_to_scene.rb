class AddLocationIdToScene < ActiveRecord::Migration
  def change
    add_reference :scenes, :location, index: true, foreign_key: true
  end
end
