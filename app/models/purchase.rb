class Purchase < ApplicationRecord
  belongs_to :seller
  has_many :comic_books

  validates :seller_id, :purchase_type_id, :date, :price, presence: true
  validates :shipping_cost, presence: true, if: Proc.new { |p| p.online? }
end
