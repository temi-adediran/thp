class Zone < ApplicationRecord
  resourcify
  belongs_to :user, inverse_of: :zone, optional: true
end
