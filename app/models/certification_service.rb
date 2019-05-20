class CertificationService < ApplicationRecord
  has_many :certifications
  has_many :certification_labels

  validates :name, presence: true
end
