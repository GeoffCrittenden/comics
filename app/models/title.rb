class Title < ApplicationRecord
  belongs_to :publisher
  has_many :issues

  validates :publisher_id, :title, :volume, :year_of_origin, presence: true
  validates :year_of_origin, numericality: { only_integer: true, greater_than_or_equal_to: 1897, less_than_or_equal_to: 2029 }
end
