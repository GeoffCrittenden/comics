class Variant < ApplicationRecord
  belongs_to :issue
  has_one :edition_type
end
