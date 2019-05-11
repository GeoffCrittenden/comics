class Title < ApplicationRecord
  belongs_to :publisher
  has_many :issues
end
