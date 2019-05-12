class Contributor < ApplicationRecord
  has_many :contributions

  validates :first_name, :last_name, presence: true
end
