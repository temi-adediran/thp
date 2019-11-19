class Role < ApplicationRecord
  ROLES = [
    :international_admin,
    :zonal_admin,
    :chapter_admin
  ].freeze

  scopify
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true, :optional => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true
  validates :name, inclusion: { in: ROLES }
end
