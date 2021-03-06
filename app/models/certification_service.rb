class CertificationService < ApplicationRecord
  has_many :certifications
  has_many :certification_labels
  alias_method :labels, :certification_labels

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
