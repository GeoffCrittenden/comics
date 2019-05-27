class PageColor < ApplicationRecord
  has_many :certifications

  validates :description, presence: true
  validates :description, uniqueness: { case_sensitive: false }
end
