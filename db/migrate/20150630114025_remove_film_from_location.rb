class RemoveFilmFromLocation < ActiveRecord::Migration
  def change
    remove_column :locations, :film, :string
  end
end
