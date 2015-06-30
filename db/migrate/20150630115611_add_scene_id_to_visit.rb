class AddSceneIdToVisit < ActiveRecord::Migration
  def change
    add_reference :visits, :scene, index: true, foreign_key: true
  end
end
