class AddAdditionalProfileToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :title, :string
    add_column :users, :country, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :home_address, :string
    add_column :users, :designation, :string
    add_column :users, :cell, :string
    add_column :users, :chapter, :string
    add_column :users, :zone, :string
    add_column :users, :current_employment, :jsonb, default: {}
    add_column :users, :academic_qualifications, :jsonb, default: {}
  end
end
