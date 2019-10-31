class AddProfileInformationToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :boolean
    add_column :users, :date_of_birth, :date
    add_column :users, :residential_address, :string
    add_column :users, :phone_no, :string
    add_column :users, :additional_phone_no, :string
    add_column :users, :email_address, :string
    add_column :users, :marital_status, :boolean
    add_column :users, :name_of_spouse, :string
    add_column :users, :wedding_anniversary, :date
    add_column :users, :date_born_again, :date
    add_column :users, :date_joined_christ_embassy, :date
    add_column :users, :current_local_church, :string
    add_column :users, :water_baptized, :boolean
    add_column :users, :date_water_baptized, :date
    add_column :users, :completed_foundation_school, :boolean
    add_column :users, :date_completed_foundation_school, :date
    add_column :users, :family, :jsonb, null: true, default: "{}"
    add_column :users, :previous_membership, :jsonb, null: true, default: "{}"
  end
end
