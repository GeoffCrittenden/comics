class Issue < ApplicationRecord
  belongs_to :title
  belongs_to :age

  has_many :contributions
  has_many :contributors, through: :contributions
  has_many :variants

  validates :title_id, :issue_number, :year_of_publication, :month_of_publication, :print_edition, :age_id, presence: true

  validates :year_of_publication,  numericality: { only_integer: true, greater_than_or_equal_to: 1897, less_than_or_equal_to: 2029 }
  validates :month_of_publication, numericality: { only_integer: true, greater_than_or_equal_to: 1,    less_than_or_equal_to: 12 }
  validates :issue_number,         numericality: { only_integer: true, greater_than_or_equal_to: -10 }
  validates :print_edition,        numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  before_validation :populate_age

  def populate_age
    return if age_id?
    if date_of_publication? || (month_of_publication? && year_of_publication?)
      date = date_of_publication || "#{month_of_publication} #{year_of_publication}".to_date
      self.age_id = Age.determine_age_for_issue_date(date)
    end
  end
end
