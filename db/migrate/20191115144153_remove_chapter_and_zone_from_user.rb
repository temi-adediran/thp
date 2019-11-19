class RemoveChapterAndZoneFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :chapter, :string
    remove_column :users, :zone, :string
  end
end
