class Chapter < ApplicationRecord
  resourcify
  has_many :users, inverse_of: :chapter
  belongs_to :zone, inverse_of: :chapters
end
