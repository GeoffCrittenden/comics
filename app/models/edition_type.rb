class EditionType < ApplicationRecord
  validates :edition_type, presence: true
  validates :edition_type, uniqueness: true
end
