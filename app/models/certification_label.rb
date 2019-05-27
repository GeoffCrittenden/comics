class CertificationLabel < ApplicationRecord
  belongs_to :certification_service
  has_many :certifications

  validates :name, uniqueness: { case_sensitive: false, scope: :certification_service_id, message: 'each service can only have one of each label' }
  validates :color, uniqueness: { case_sensitive: false, scope: :certification_service_id, message: 'each service can only have one of each label' }
end
