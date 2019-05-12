class Title < ApplicationRecord
  belongs_to :publisher
  has_many :issues

  validates :publisher_id, :title, :volume, :year_of_origin, presence: true
  validates :year_of_origin, format: { with: /\A19[0-9][0-9]|200[0-9]|201[0-9]|202[0-9]\z/, message: 'must be a valid year between 1900 and 2029' }
end
