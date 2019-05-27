class ComicBook < ApplicationRecord
  belongs_to :certification
  belongs_to :purchase
  belongs_to :variant

  validates :purchase_id, :variant_id, presence: true
end
