class Certification < ApplicationRecord
  belongs_to :certification_label
  belongs_to :certification_service
  belongs_to :comic_book
  belongs_to :grade
  belongs_to :page_color

  validates :certification_label_id, :certification_service_id, :comic_book_id, :grade_id, :page_color_id, presence: true
  validates :comic_book_id, uniqueness: true
end
