class Seller < ApplicationRecord
  has_many :purchases

  validates :name, presence: true, uniqueness: true
end
