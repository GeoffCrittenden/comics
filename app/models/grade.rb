class Grade < ApplicationRecord
  validates :grade, :name, :abbreviation, presence: true
  validates :grade, format: {
    with:    /10\.0|9\.9|9\.8|9\.6|9\.4|9\.2|9\.0|8\.5|8\.0|7\.5|7\.0|6\.5|6\.0|5\.5|5\.0|4\.5|4\.0|3\.5|3\.0|2\.5|2\.0|1\.8|1\.5|1\.0|0\.5/,
    message: 'Must be a single-place decimal number in the universally accepted comic book grading scale'
  }
  validates :grade, uniqueness: { scope: %i[name abbreviation] }
end
