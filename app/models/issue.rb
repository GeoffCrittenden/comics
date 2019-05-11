class Issue < ApplicationRecord
  belongs_to :title
  has_many :contributions
  has_many :contributors, through: :contributions
  has_many :variants
end
