class ContributionType < ApplicationRecord
  has_many :contributions

  validates :name, presence: true
end
