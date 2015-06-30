class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :imdbID
      t.string :name
    end
  end
end
