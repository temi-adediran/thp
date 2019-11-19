class AddReferencesToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :zone, foreign: true
    add_reference :users, :chapter, foreign: true
    add_reference :chapters, :zone, foreign: true
  end
end
