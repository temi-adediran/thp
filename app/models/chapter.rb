class Chapter < ApplicationRecord
  resourcify
  belongs_to :user, inverse_of: :chapter, optional: true
end
