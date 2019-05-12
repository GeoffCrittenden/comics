class Variant < ApplicationRecord
  belongs_to :issue
  belongs_to :edition_type

  validates :issue_id, :variant_identifier, :edition_type_id, presence: true
  validates :variant_identifier, format: { with: /\A[A-Z]\z/, message: 'must be a single capital letter' }
  validates :variant_description, presence: true, unless: Proc.new { |v| v.variant_identifier == 'A' }
end
