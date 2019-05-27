class Publisher < ApplicationRecord
  has_many :titles

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
