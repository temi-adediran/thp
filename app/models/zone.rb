class Zone < ApplicationRecord
  resourcify
  has_many :users, inverse_of: :zone
  has_many :chapters, inverse_of: :zone
end
