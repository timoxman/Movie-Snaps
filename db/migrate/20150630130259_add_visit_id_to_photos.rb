class AddVisitIdToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :visit, index: true, foreign_key: true
  end
end
