class Publisher < ApplicationRecord
  has_many :titles

  validates :name, presence: true
end
