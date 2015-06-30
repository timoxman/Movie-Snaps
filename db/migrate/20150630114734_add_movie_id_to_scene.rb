class AddMovieIdToScene < ActiveRecord::Migration
  def change
    add_reference :scenes, :movie, index: true, foreign_key: true
  end
end
